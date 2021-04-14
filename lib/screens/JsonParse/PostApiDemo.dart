//import 'dart:async';
//import 'dart:convert';
//import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//
//class Post {
//  final String userId;
//  final int id;
//  final String title;
//  final String body;
//
//  Post({this.userId, this.id, this.title, this.body});
//
//  factory Post.fromJson(Map json) {
//    return Post(
//      userId: json['userId'],
//      id: json['id'],
//      title: json['title'],
//      body: json['body'],
//    );
//  }
//
//  Map toMap() {
//    var map = new Map();
//    map["userId"] = userId;
//    map["title"] = title;
//    map["body"] = body;
//
//    return map;
//  }
//}
//
//Future createPost(String url, {Map body}) async {
//  return http.post(url, body: body).then((http.Response response) {
//    final int statusCode = response.statusCode;
//
//    if (statusCode < 200 || statusCode > 400 || json == null) {
//      print('Title:${response.body}');
//      throw new Exception("Error while fetching data");
//    }
//    return Post.fromJson(json.decode(response.body));
//  });
//}
//
//class PostApiDemo extends StatelessWidget {
//  final Future post;
//
//  PostApiDemo({Key key, this.post}) : super(key: key);
//  static final CREATE_POST_URL = 'https://jsonplaceholder.typicode.com/posts';
//  TextEditingController titleControler = new TextEditingController();
//  TextEditingController bodyControler = new TextEditingController();
//
// Future<Widget> getData() async{
//   Post newPost = new Post(
//       userId: "123", id: 0, title: titleControler.text, body: bodyControler.text);
//   Post p = await createPost(CREATE_POST_URL,
//       body: newPost.toMap());
//   print('UserID: ${ p.userId}');
//   print('Id:${p.id}');
//   print('Title :${p.title}');
//   print('Body:${p.body}');
//   return Container(
//     child: Column(
//       children: [
//        Text('UserID: ${ p.userId}'),
//        Text('Id:${p.id}'),
//        Text('Title :${p.title}'),
//        Text('Body:${p.body}'),
//
//       ],
//     ),
//   );
//
//
//
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      title: "WEB SERVICE",
//      theme: ThemeData(
//
//      ),
//      home: Scaffold(
//          appBar: AppBar(
//            title: Text('Create Post'),
//          ),
//          body: new Container(
//            margin: const EdgeInsets.only(left: 8.0, right: 8.0),
//            child: new Column(
//              children: [
//                new TextField(
//                  controller: titleControler,
//                  decoration: InputDecoration(
//                       labelText: 'Post Title'),
//                ),
//                new TextField(
//                  controller: bodyControler,
//                  decoration: InputDecoration(
//                     labelText: 'Post Body'),
//                ),
//                new RaisedButton(
//                  onPressed: ()  {
//                  getData();
//                  },
//                  child: const Text("Create"),
//                ),
//                Container(
//
//                )
//
//              ],
//            ),
//          )),
//    );
//  }
//}
//
//void main() => runApp(PostApiDemo());

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> createAlbum(String title) async {
  final http.Response response = await http.post(
    'https://jsonplaceholder.typicode.com/albums',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,

    }),
  );

  if (response.statusCode == 201) {
    print('Post Api:${response.body}');
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}

class Album {
  final int id;
  final int userId;
  final String title;

  Album({this.id, this.title, this.userId});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
    );
  }
}

void main() {
  runApp(PostApiDemo());
}

class PostApiDemo extends StatefulWidget {
  PostApiDemo({Key key}) : super(key: key);

  @override
  _PostApiDemoState createState() {
    return _PostApiDemoState();
  }
}

class _PostApiDemoState extends State<PostApiDemo> {
  final TextEditingController _controller = TextEditingController();
  Future<Album> _futureAlbum;
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
//        appBar: AppBar(
//          title: Text('Post Api Demo'),
//
//        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_futureAlbum == null)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 250,
                      height: 50,
                      child: TextField(

                        controller: _controller,
                        decoration: InputDecoration(
                            focusedBorder: focusborder(),
                            enabledBorder: outlineborder(),
                            hintText: 'Enter Title'),
                      ),
                    ),
                    RaisedButton(
                      child: Text('Create Data'),
                      onPressed: () {
                        setState(() {
                          // _futureAlbum = createAlbum('Id:');
                          _futureAlbum = createAlbum('${_controller.text} ');
                        });
                      },
                    ),
                  ],
                )
              : Column(
                  children: [
                    FutureBuilder<Album>(
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
                                          Text('Title:${snapshot.data?.title}')),
                                  Container(
//                                      child: Text(
//                                          'UserId:${snapshot.data?.userId}'))
                                  )
                                ]);
                          }
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
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
