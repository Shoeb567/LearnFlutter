import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_firebase/screens/cldScreene/DBHelperFirebase_Sqlite.dart';
import 'package:flutter_app_firebase/screens/cldScreene/clgData.dart';

class UserServicesFirebase extends ChangeNotifier {
  List<SignInData> usersData = [];
  List<SignInData> signInList = [];

  final user =  FirebaseAuth.instance.currentUser;
  UserServicesFirebase() {
    fetchUsers();
    getSignInData();
  }


   saveUser(String id,String name, String surname, String email, String mobile,
      String password)  async{
//    final reference1 =
//    FirebaseDatabase.instance.reference().child('SignInDetails').child('uid');
//    reference1.orderByKey().equalTo(user.uid).once().then((DataSnapshot dataSnapshot) async{
     // print('Call Sql Method====');
       DBHelperFirebase.insert('signinTable', {

        //'id': DateTime.now().toString() ,
        'id': id,
        'name': name,
        'surname': surname,
        'email': email,
        'mobile': mobile,
        'password': password
      });
      await fetchUsers();
      notifyListeners();
   // });
  }

 fetchUsers() async {

      final usersList = await DBHelperFirebase.getData('signinTable');

        usersData = usersList
            .map((element) =>
            SignInData.sqlLite(
                id: element['id'],
                name: element['name'],
                surname: element['surname'],
                email: element['email'],
                mobile: element['mobile'],
                password: element['password'])).toList();

      usersData.toList();
      print('SQl User List:${usersData.length}');
   // });
    //users1.clear();
   notifyListeners();

  }

  void deleteUser(String id)  {
    DBHelperFirebase.deleteDataSignIn('signinTable', id);
    fetchUsers();
   notifyListeners();
  }

  getSignInData() async{
   // usersData.clear();
    DatabaseReference reference1 =
        FirebaseDatabase.instance.reference().child('SignInDetails');
    reference1.once().then((DataSnapshot dataSnapshot) {
      signInList.clear();
      var KEYS = dataSnapshot.value.keys;
      var Values = dataSnapshot.value;

      for (var key in KEYS) {
        SignInData data = new SignInData(
            Values[key]['uid'],
            Values[key]['name'],
            Values[key]['surname'],
            Values[key]['email'],
            Values[key]['mobile'],
            Values[key]['password']);
        signInList.add(data);

      }
      //users1.clear();
      for(int i=0;i<signInList.length;i++) {
        //print('For Loop');
        saveUser(
            signInList[i].id, signInList[i].name, signInList[i].surname, signInList[i].email,
            signInList[i].mobile, signInList[i].password);
        print('user list==>:${signInList[i].id}');
      }
      notifyListeners();
      print('Firebase User List:${signInList.length}');
    });
  }

}
