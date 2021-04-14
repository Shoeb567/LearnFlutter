import 'package:flutter/material.dart';
import './Service.dart';
import './PostApiClass.dart';
import './PostService.dart';

import 'package:http/http.dart' as http;

class PostApiData extends StatefulWidget {
  @override
  _PostApiDataState createState() => _PostApiDataState();
}

class _PostApiDataState extends State<PostApiData> {
  TextEditingController postNum = TextEditingController();
  bool pressed = false;
  List<UserData> _users = [];

  //bool _loading;
  @override
  void initState() {
    super.initState();
    // _loading = true;
    Services.getUsers().then((users) {
      _users = users;
      setState(() {
        //  _loading = false;
      });
    });
  }

  FutureBuilder<UserData> fetchData(postNum) {
    return FutureBuilder<UserData>(
      future: fetchPosts(postNum.text.toString()),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return getData(snapshot);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }

  Widget getData(snapshot) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(10)),
          Text("ID : " + snapshot.data.id.toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Padding(padding: EdgeInsets.all(11)),
          Text("Name : " + snapshot.data.name, style: TextStyle(fontSize: 20)),
          Text("Phone : " + snapshot.data.phone,
              style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
//      appBar: AppBar(
//        title: Text('Users'),
//        centerTitle: true,
//      ),
      body:  isLoading
        ? Center(child: CircularProgressIndicator())
        :SingleChildScrollView(
      child:Container(
        color: Colors.greenAccent,
        padding: EdgeInsets.all(10),
        child: () {
          return Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              children: [
                TextFormField(
                  controller: postNum,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Enter ID',
                  ),
                ),
                Container(
                    width: 150,
                    child: RaisedButton(
                        color: Colors.blue,
                        onPressed: () {
                          setState(() {
                            pressed = true;
                          });
                        },
                        child: Text(
                          'Post API Data',
                          style: TextStyle(color: Colors.white),
                        ))),
                pressed ? fetchData(postNum) : SizedBox(),
                SizedBox(height: 30),
                Container(
                  // padding: EdgeInsets
                  // .only(top: 150),
                  height: 450,
                  width: 350,
                 // color: Colors.yellowAccent,
                  child: ListView.builder(
                      itemCount: null == _users ? 0 : _users.length,
                      itemBuilder: (context, index) {
                        UserData user = _users[index];
                        return Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.black))),
                          child: ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.id.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                //Text('Name:  ${user.name}'),
                                //Text('Phone: ${user.phone}'),
                                Text(' ${user.name}'),
                                Text(' ${user.phone}'),
                              ],
                            ),
                            //subtitle: Text('${user.name} '),
                          ),
                        );
                      }),
                )
              ],
            ),);

        }(),
      ),
    ));
  }
}

class Services {
  static const String url = ('https://jsonplaceholder.typicode.com/users/');

  static Future<List<UserData>> getUsers() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final List<UserData> users = userFromJson(response.body);
        return users;
      } else {
        //return List<User>();
        throw Exception('Can;t Find Data');
      }
    } catch (e) {
      return List<UserData>();
    }
  }
}
