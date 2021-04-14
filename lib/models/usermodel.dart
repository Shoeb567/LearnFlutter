import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {


  String email;
  String password;
  Timestamp timestamp;
  String uid;
  UserModel(
      {this.email, this.password,this.timestamp, this.uid});

  toMap() {
    return {
      'email': email,
      'password':password,
      'uid': uid,
      'timestamp': FieldValue.serverTimestamp()
    };
  }

  // 4th part - from map to model object

  factory UserModel.fromMap(Map map) {
    return UserModel(
      email: map["email"],
      password: map['password'],
      timestamp: map["timestamp"],
      uid: map["uid"],
    );
  }
}

