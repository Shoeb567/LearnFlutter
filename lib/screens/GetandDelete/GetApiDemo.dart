import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import './classUser.dart';
import './Services.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
import './addPostFile.dart';

class GetApiDemo extends StatefulWidget {
  @override
  _GetApiDemoState createState() => _GetApiDemoState();
}

class _GetApiDemoState extends State<GetApiDemo> {
  Future<UserModel> classData;
  Services get = Services();
  Widget refreshBg() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20.0),
      color: Colors.red,
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }

  @override
  void initState() {
    classData = get.getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        appBar: AppBar(
//          title: Text('Users'),
//          centerTitle: true,
//        ),
        body: Container(

              color: Colors.greenAccent,
              padding: EdgeInsets.all(10),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: FutureBuilder<UserModel>(
                    future: classData,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Data> list = snapshot.data.data;
                        return ListView.builder(
                            padding: EdgeInsets.all(20.0),
                            itemCount: snapshot.data.data.length,
                            itemBuilder: (context, index) {
                              //  final item = list[index];
                              Data user = list[index];
                              return Dismissible(
                                background: refreshBg(),
                                key: ObjectKey(snapshot.data.data[index].id),
                                onDismissed: (direction) {
                                  print('Direction:${direction.index}');
                                  Services.deleteAuthor(
                                          snapshot.data.data[index].id.toString())
                                      .then((value) => value);
                                  list.removeAt(index);
                                  setState(() {});
                                  Scaffold.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Id:${user.id} is removed."),
                                      action: SnackBarAction(
                                        label: 'UNDO',
                                        onPressed: () {
                                          // undoDelete(index, (user.id));
                                        },
                                      ),
                                    ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black))),
                                      child: Card(
                                        child: ListTile(
                                          title: Text(
                                            '${user.id} - ${user.name}',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          subtitle: Text(
                                              '${user.email} \n ${user.gender} \n ${user.status}',
                                              style:
                                                  TextStyle(color: Colors.black)),
                                          trailing: IconButton(
                                            onPressed: () {
                                              setState(() {
//                                                return Dismissible(
//                                                  key: new Key(
//                                                      list[index].id.toString()),
//                                                  onDismissed: (direction) {
//                                                    list.removeAt(index);
//                                                    Scaffold.of(context)
//                                                        .showSnackBar(SnackBar(
//                                                            content: Text(
//                                                                "Id:${user.id} is removed.")));
//                                                  },
//                                                );
                                              });
                                            },
                                            icon: Icon(Icons.delete),
                                          ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),

                              );
                            });
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
              )),
              floatingActionButton: FloatingActionButton(
                child: Text('Add'),
                onPressed: (){
                  gotoPostFile(context);
                },
              ),


    );
  }
}
// ignore: missing_return
//  Future<UserModel> deleteAlbum(String id) async {
//
//  final http.Response response = await http.delete(
//    'https://gorest.co.in/public-api/users/$id',
//    headers: <String, String>{
//      'Content-Type': 'application/json; charset=UTF-8',
//    },
//  );
//  if (response.statusCode == 200) {
//    print('Delete Data');
//    //return null;
//     UserModel.fromJson(jsonDecode(response.body));
//   // print( response.body);
//   // return response;
//  } else {
//    throw Exception('Item Not Deleted!');
//    //return UserModel.fromJson(json.decode(response.body)['id']);
//
//  }
//}
Future gotoPostFile(context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => PostFile()));
}
