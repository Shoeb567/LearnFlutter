import 'dart:async';
import 'dart:convert';
import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response =
  await http.get('https://jsonplaceholder.typicode.com/albums/3');

  if (response.statusCode == 200) {
  //print("Update Api:${response.body}");

    return Album.fromJson(jsonDecode(response.body));

  } else {

    throw Exception('Failed to load album');
  }
}

Future<Album> updateAlbum(String title) async {
  final http.Response response = await http.put(
    'https://jsonplaceholder.typicode.com/albums/1',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 200) {
    print("Update Api:${(response.body)}");
    return Album.fromJson(jsonDecode(response.body));
  } else {

    throw Exception('Failed to update album.');
  }
}

class Album {
  final int id,userId;
  final String title;

  Album({this.id, this.title,this.userId});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
    );
  }
}

void main() {
  runApp(PutMethod());
}

class PutMethod extends StatefulWidget {
  PutMethod({Key key}) : super(key: key);

  @override
  _PutMethodState createState() {
    return _PutMethodState();
  }
}

class _PutMethodState extends State<PutMethod> {
  final TextEditingController _controller = TextEditingController();
  Future<Album> _futureAlbum ;

  @override
  void initState() {
    super.initState();
    _futureAlbum = fetchAlbum();
  }
  focusborder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue, width: 1.0),
      borderRadius: BorderRadius.circular(5.0),
    );
  }
  outlineborder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
//      title: 'Update Data Example',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
      home: Scaffold(
    resizeToAvoidBottomPadding: false,
//        appBar: AppBar(
//          title: Text('Put Api Data'),
//        ),
        body: Container(
          height: 500,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<Album>(
            future: _futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('Id:${snapshot.data?.id  }'),
                      //Text('UserId:${snapshot.data?.userId}'),
                      Text('Title:${snapshot.data?.title}'),
                      SizedBox(height: 20),
                      Container(
                        width: 250,
                        height: 50,
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                              focusedBorder: focusborder(),
                              enabledBorder: outlineborder(),
                              hintText: 'Enter Title'),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      RaisedButton(
                        child: Text('Update Data'),
                        onPressed: () {
                          setState(() {
                            _futureAlbum = updateAlbum(_controller.text);
                          });
                        },
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
              }

              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
