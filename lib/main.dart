import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_firebase/models/phonebook/contacts.dart';
import 'package:flutter_app_firebase/screens/apiscreens/tabviewapiscreens.dart';
import 'package:flutter_app_firebase/screens/cldScreene/fatchclgscreen.dart';
import 'package:flutter_app_firebase/screens/cldScreene/profilepage.dart';
import 'package:flutter_app_firebase/screens/designscreens/Drawer.dart';
import 'package:flutter_app_firebase/screens/designscreens/tabView.dart';

import 'package:flutter_app_firebase/screens/homescreen.dart';
import 'package:flutter_app_firebase/screens/loginscreen.dart';
import 'package:flutter_app_firebase/screens/signinscreen.dart';
import 'package:flutter_app_firebase/screens/splash_screen.dart';
//import 'package:provider/provider.dart';
import 'models/authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  focusborder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: colorUse(), width: 1.0),
      borderRadius: BorderRadius.circular(5.0),
    );
  }
  colorUse(){
    return  Color(0xFFE57373);
  }
  outlineborder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color:colorUse(), width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    );
  }

  @override
  Widget input(name, value) {
    return TextField(
        controller: value,

        decoration: InputDecoration(
          focusedBorder: focusborder(),
          enabledBorder: outlineborder(),
          hintText: name,
          contentPadding: EdgeInsets.only(top: 30,left: 20,right: 20),
        ));
  }
  @override
  Widget build(BuildContext context) {

    //return MultiProvider(
////      providers: [
//////        ChangeNotifierProvider.value(
//////          value: Authentication(),
//////        )
////      ],
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login App',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        //home: SplashScreen(),
         home: FatchScreen(),
      //  routes: {
         // SignInScreen.routeName: (ctx)=> SignInScreen(),
          //LogInScreen.routeName: (ctx)=> LogInScreen(),
         // HomeScreen.routeName: (ctx)=> HomeScreen(),
        //},

    );
  }
}