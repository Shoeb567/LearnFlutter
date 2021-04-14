import 'package:flutter/material.dart';
import './classUser.dart';
import 'dart:async';
import 'dart:convert';


import 'package:http/http.dart' as http;
class PostFile extends StatefulWidget {
  @override
  _PostFileState createState() => _PostFileState();
}

class _PostFileState extends State<PostFile> {
  final TextEditingController id = TextEditingController();
  final TextEditingController nameDemo = TextEditingController();
  final TextEditingController email = TextEditingController();
  Future<Data> _futureAlbum;

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
      title: 'Creating Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Post Api Demo'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_futureAlbum == null)
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 250,
                height: 50,
                child: TextField(
                  controller: id,
                  decoration: InputDecoration(
                      focusedBorder: focusborder(),
                      enabledBorder: outlineborder(),
                      hintText: 'Enter ID'),
                ),
              ),
              SizedBox(height: 15),
              Container(
                width: 250,
                height: 50,
                child: TextField(
                  controller: nameDemo,
                  decoration: InputDecoration(
                      focusedBorder: focusborder(),
                      enabledBorder: outlineborder(),
                      hintText: 'Enter Name'),
                ),
              ),              SizedBox(height: 15),
              Container(
                width: 250,
                height: 50,
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                      focusedBorder: focusborder(),
                      enabledBorder: outlineborder(),
                      hintText: 'Enter Email'),
                ),
              ),              SizedBox(height: 15),
              RaisedButton(
                child: Text('Add Data'),
                onPressed: () {
                  setState(() {
                     //_futureAlbum = createAlbum('Id:');
                     _futureAlbum = createAlbum('${id.text} ');
                     _futureAlbum = createAlbum('${nameDemo.text} ');

                  });
                },
              ),
            ],
          )
              : Column(
            children: [
              FutureBuilder<Data>(
                future: _futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                child:
                                Text('UserID:${snapshot.data?.id}')),
                            Container(
                                child:
                                Text('Name:${snapshot.data?.name}')),
//                            Container(
////                                      child: Text(
////                                          'UserId:${snapshot.data?.userId}'))
//                            )
                          ]);
                    }
                  } else if (snapshot.hasError) {
                    return Text("Not Found Data${snapshot.error}");
                  }

                  return CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<Data> createAlbum(String name) async {
  final http.Response response = await http.post(
    'https://gorest.co.in/public-api/users',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
    //  'email':email

    }),
  );

  if (response.statusCode == 200) {
    print('Post Api:${response.body}');
    return Data.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}
