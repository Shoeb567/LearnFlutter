import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_firebase/screens/cldScreene/clgData.dart';
import 'package:flutter_app_firebase/screens/designscreens/tabView.dart';
import 'package:flutter_app_firebase/screens/signinscreen.dart';
import 'package:provider/provider.dart';

import 'package:intl/intl.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final _firebaseAuth = FirebaseAuth.instance.currentUser;
  SignInScreen save = SignInScreen();


  List<SignInData> signInList = [];

  void initState() {
   // print('INIT Method=============');
    super.initState();
    DatabaseReference reference1 =
    FirebaseDatabase.instance.reference().child('SignInDetails');
    reference1.equalTo(_firebaseAuth.uid).orderByKey().once().then((DataSnapshot dataSnapshot) {
  //    print('===========================');
      signInList.clear();
      var KEYS = dataSnapshot.value.keys;
      var Values = dataSnapshot.value;

      for (var key in KEYS) {
        SignInData data = new SignInData(
            Values[key]['uid'],
            Values[key]['email'],
            Values[key]['mobile'],
            Values[key]['name'],
            Values[key]['surname'],
            Values[key]['password']
//            Values [key]['name'],
//            Values [key]['surname']
        );
        signInList.add(data);
        setState(() {
        //   print('===================Length:${signInList.length}');
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
  //  print('======');
    return Scaffold(
      appBar: AppBar(
//        leading: new IconButton(
//          icon: new Icon(Icons.arrow_back),
//          onPressed: () => Navigator.push(context, MaterialPageRoute(builder:(context) {
//            return TabView();
//          },)),
//        ),
        backgroundColor:  Color.fromRGBO(150, 170, 105, 5),
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(40),
          child: Column(

            children: <Widget>[
              Container(
                      height: 100,
                child: Image(

                    image:NetworkImage('https://www.thestudentcircle.com/sub-subject-icon/MjAyMC0wNi0xMyAwNDoxNTozNA==_flutter-logo-round.png')),

              ),
              SizedBox(height: 40),
              Expanded(
                child: ListView.builder(

                  itemCount: signInList.length,
                  itemBuilder: (context, snapshot) {
                    return Card(
                      child: Column(
                        children: <Widget>[
                          Container(
                              color:Colors.black,
                            child: Card(
                              child: ListTile(
                              //  padding: const EdgeInsets.all(8.0),
                                title: Text(
                                  "Name:        ${signInList[snapshot].name}",
                                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),

                          Container(
                            color:Colors.black,
                            child: Card(
                              child: ListTile(
                                //  padding: const EdgeInsets.all(8.0),
                                title: Text(
                                  "Surname:       ${signInList[snapshot].surname}",
                                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color:Colors.black,
                            child: Card(
                              child: ListTile(
                                //  padding: const EdgeInsets.all(8.0),
                                title: Text(
                                  "MobileNo:       ${signInList[snapshot].mobile}",
                                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color:Colors.black,
                            child: Card(
                              child: ListTile(
                                //  padding: const EdgeInsets.all(8.0),
                                title: Text(
                                  "Email:      ${signInList[snapshot].email}",
                                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),


                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),

    );
  }
}
