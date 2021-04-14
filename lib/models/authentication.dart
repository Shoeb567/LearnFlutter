//import 'dart:convert';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter_app_firebase/models/exception.dart';
//import 'package:http/http.dart' as http;
//import 'package:google_sign_in/google_sign_in.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'dart:async';
//
//FirebaseAuth auth = FirebaseAuth.instance;
//final googleSignIn = GoogleSignIn();
//
//Future<bool> googlesignin() async{
//  GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//
//  if(googleSignInAccount != null){
//    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
//
//    AuthCredential credential = GoogleAuthProvider.getCredential(idToken: googleSignInAuthentication.idToken,
//        accessToken:googleSignInAuthentication.accessToken);
//
//    AuthResult result = await auth.signInWithCredential(credential);
//
//    FirebaseUser user = await auth.currentUser();
//    print(user.uid);
//    return Future.value(true);
//  }
//}
//class Authentication with ChangeNotifier {
////  Future<void> signUp(String email, String password) async {
////    const url =
////        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBw5FnkaBOHrkdvwf-2wuoHlwAxbval2As';
////
////    try {
////      final response = await http.post(url,
////          body: json.encode({
////            'email': email,
////            'password': password,
////            'returnSecureToken': true,
////          }));
////
////      final responseData = json.decode(response.body);
////      print(responseData);
////      if (responseData['error'] != null) {
////        throw HttpException(responseData['error']['message']);
////      }
////    } catch (error) {
////      throw error;
////    }
////  }
//
////  Future<void> logIn(String email, String password) async {
////    const url =
////        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBw5FnkaBOHrkdvwf-2wuoHlwAxbval2As';
////
////    try {
////      final response = await http.post(url,
////          body: json.encode({
////            'email': email,
////            'password': password,
////            'returnSecureToken': true,
////          }));
////      final responseData = json.decode(response.body);
////      print(responseData);
////      if (responseData['error'] != null) {
////        throw HttpException(responseData['error']['message']);
////      }
////    } catch (error) {
////      throw error;
////    }
////  }
//}
//
//Future<bool> signOutUser() async{
//  FirebaseUser user = await auth.currentUser();
//
//  if(user.providerData[1].providerId == 'google.com'){
//    await googleSignIn.disconnect();
//  }
//  await auth.signOut();
//}
//
//
//
//
//
