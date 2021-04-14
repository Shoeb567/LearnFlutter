import 'package:flutter/material.dart';
import './Service.dart';
import './Users.dart';

class JsonParseDemo extends StatefulWidget {
  @override
  _JsonParseDemoState createState() => _JsonParseDemoState();
}

class _JsonParseDemoState extends State<JsonParseDemo> {
  List<User> _users = [];
Services get = Services();
Future<User> classData;
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
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('Users'),
//        centerTitle: true,
//      ),
      body: Container(
        color: Colors.greenAccent,

        padding: EdgeInsets.all(10),
        child: Card(

            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),



                 child:
                 ListView.builder(
                     itemCount: _users.length,
                     itemBuilder: (context, index) {
                       // ignore: missing_return
                       User user = _users[index];

                         return Container(
                           decoration: BoxDecoration(
                               border: Border(
                                   bottom: BorderSide(color: Colors.black))),
                           child: ListTile(
                             title: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(user.name.toString(), style: TextStyle(
                                     fontWeight: FontWeight.bold,
                                     fontSize: 20),),
                                 //Text('Name:  ${user.name}'),
                                 //  Text('Phone: ${user.phone}'),

                                 Text(' ${user.emoji}'),
                                 Text(' ${user.code}'),
                               ],
                             ),
                             //subtitle: Text('${user.name} '),

                           ),

                       );
                     })


          )

      ),
    );
  }
}
