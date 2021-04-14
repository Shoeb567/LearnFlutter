import 'package:flutter/material.dart';
import 'package:flutter_app_firebase/screens/cldScreene/clgData.dart';
import 'package:firebase_database/firebase_database.dart';

import 'dart:collection';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_firebase/screens/cldScreene/profilepage.dart';
import 'package:flutter_app_firebase/screens/cldScreene/userservicesFirebase_sqlite.dart';
import 'package:flutter_app_firebase/screens/designscreens/tabView.dart';
import 'package:provider/provider.dart';
//
//
class FatchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserServicesFirebase>(
        create: (BuildContext context) {
          return UserServicesFirebase();
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: ('Database DemoApp'),
          home: FatchClgScreen(),
        ));
  }
}
class FatchClgScreen extends StatefulWidget {
  @override
  _FatchClgScreenState createState() => _FatchClgScreenState();
}

class _FatchClgScreenState extends State<FatchClgScreen> {
  // List<ClgData> clgList = [];
  //List<SignInData> signInList = [];


//  void initState(){
//    print('INIT Method=============');
//    super.initState();
//     DatabaseReference reference1 = FirebaseDatabase.instance.reference().child('colleges');
//    print('==========================');
//    reference1.once().then((DataSnapshot dataSnapshot) {
//      print('===========================');
//     clgList.clear();
//      var KEYS = dataSnapshot.value.keys;
//      var Values = dataSnapshot.value;
//
//      for (var key in KEYS) {
//        ClgData data = new ClgData(
//            Values [key]['name'],
//            Values [key]['description'],
//            Values [key]['imgUrl']
//        );
//        clgList.add(data);
//        setState(() {
//          print('===================Length:${clgList.length}');
//        });
//      }
//    });
//}

//  void initState() {
//  //  print('INIT Method=============');
//    super.initState();
//    DatabaseReference reference1 =
//        FirebaseDatabase.instance.reference().child('SignInDetails');
//   // print('==========================');
//    reference1.once().then((DataSnapshot dataSnapshot) {
//     // print('===========================');
//      signInList.clear();
//      var KEYS = dataSnapshot.value.keys;
//      var Values = dataSnapshot.value;
//
//      for (var key in KEYS) {
//        SignInData data = new SignInData(
//            Values[key]['email'],
//            Values[key]['mobile'],
//            Values[key]['name'],
//            Values[key]['surname'],
//            Values[key]['password']
////            Values [key]['name'],
////            Values [key]['surname']
//            );
//        signInList.add(data);
//        setState(() {
//         // print('===================Length:${signInList.length}');
//        });
//      }
//    });
//  }

  @override
  Widget build(BuildContext context) {

   var viewModel = Provider.of<UserServicesFirebase>(context);

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
//          leading: new IconButton(
//            icon: new Icon(Icons.arrow_back),
//            onPressed: () => Navigator.push(context, MaterialPageRoute(builder:(context) {
//              return TabView();
//            },)),
//          ),
          backgroundColor:  Color.fromRGBO(150, 170, 105, 5),
          title: Text('College List'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.supervised_user_circle,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>ProfileView() ));
              },
            )
          ],
        ),
        body: viewModel.usersData.length == 0
            ? Center(child: Text('No Data Available'))
            : Container(
                color: Colors.cyan,
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      child: Text('Student List',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount:viewModel.usersData.length,
                          itemBuilder: (context, index) {

                            return Card(
                              margin:
                                  EdgeInsets.only(left: 20, right: 20, top: 20),
                              elevation: 5,
                              child: ListTile(
                                title: Text('UID:${viewModel.usersData[index].id} \nName::    ${viewModel.usersData[index].name}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                subtitle: Text(
                                    'Surname:   ${viewModel.usersData[index].surname} \n'
                                        'Email:         ${viewModel.usersData[index].email}\n'
                                        'MobileNo:  ${viewModel.usersData[index].mobile} ',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                trailing:  IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {

                                    viewModel
                                        .deleteUser(
                                        viewModel.usersData[index].email);
                                  },
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ));
  }
}
