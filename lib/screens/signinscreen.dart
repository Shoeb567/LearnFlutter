import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_firebase/screens/cldScreene/userservicesFirebase_sqlite.dart';
import 'package:flutter_app_firebase/screens/cldScreene/userservicesFirebase_sqlite.dart';
import 'package:flutter_app_firebase/screens/decoratescreen.dart';
import 'package:flutter_app_firebase/screens/homescreen.dart';
import 'package:flutter_app_firebase/screens/loginscreen.dart';
import 'package:provider/provider.dart';



class ShowSignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserServicesFirebase>(
        create: (BuildContext context) {
          return UserServicesFirebase();
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: ('Database DemoApp'),
          home: SignInScreen(),
        ));
  }
}

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var _formKey = GlobalKey<FormState>();
  final design = DecorateScreen();
  String _email, _pass,_mobile,_name,_surname;
  bool autoValidate = false;
  final auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser;
  bool isLoading = false;

  final fb =  FirebaseAuth.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signUp() async {
   _formKey.currentState.save();
    try {
      final new_user = await auth.createUserWithEmailAndPassword(
          email: email.text, password: pass.text);
      if (new_user != null) {
        await new_user.user.sendEmailVerification();

        print('email send');
      }
    } catch (e) {
      print(e);
    }
  }

  TextEditingController email,pass,mobile,name,surname;
  DatabaseReference _ref;
  @override
  void initState(){
    super.initState();
    email = TextEditingController();
    mobile = TextEditingController();
    pass = TextEditingController();
    name = TextEditingController();
    surname = TextEditingController();

    _ref = FirebaseDatabase.instance.reference().child('SignInDetails');
  }
//  TextEditingController email = new TextEditingController();
//  TextEditingController otp = new TextEditingController();
//  TextEditingController pass = new TextEditingController();
//
//  Map<String, String> _authData = {'email': '', 'password': ''};
//
//  Future<void> _onsubmit() async {
//    if (!_formKey.currentState.validate()) {
//      return;
//    }
//    _formKey.currentState.save();
//    await Provider.of<Authentication>(context, listen: false)
//        .signUp(_authData['email'], _authData['password']);
//  }


//  Future<void> signUp() async {
//    const url =
//        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBw5FnkaBOHrkdvwf-2wuoHlwAxbval2As';
//
//    try {
//      final response = await http.post(url,
//          body: json.encode({
//            'email': email.text,
//            'password': pass.text,
//            'returnSecureToken': true,
//          }));
//
//      final responseData = json.decode(response.body);
//      print('Response data::${responseData}');
//      if (responseData['error'] != null) {
//        throw HttpException(responseData['error']['message']);
//      }
//    } catch (error) {
//      throw error;
//    }
//  }
//  void sendOTP() async {
//    EmailAuth.sessionName = 'Firebase App OTP';
//    var res = await EmailAuth.sendOtp(receiverMail: email.text);
//    if (res) {
//      showDialogOtpSend();
//      print('OTP send');
//    } else {
//      print('error');
//    }
//  }

//  void verifyOTP() {
//    var res = EmailAuth.validate(receiverMail: email.text, userOTP: otp.text);
//    if (res) {
//      _onsubmit();
//      showDialogOtpVerify();
//      print('OTP verified');
//    } else {
//      showDialogOtpNotVerify();
//      print('Invalid otp');
//    }
//  }

  void saveContact() async{
//    _formKey.currentState.save();
//    final new_user = await auth.createUserWithEmailAndPassword(
//        email: email.text, password: pass.text);
//    String email_data = email.text;
//    String mobile_data = mobile.text;
//    String password_data = pass.text;
//    String name_data = name.text;
//    String surname_data = surname.text;
//
//    Map<String,String> signin = {
//    'email':email_data,
//    'mobile': mobile_data,
//    'name':name_data,
//    'surname':surname_data,
//    'password':password_data,
//    'uid':user.uid
//    //'type': _typeSelected,
//    };
//
//    _ref.child(user.uid).set(signin).then((value) {
//    //Navigator.pop(context);
//    });

    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        final user1= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: pass.text);
        if(user1 != null){
          await user1.user.sendEmailVerification();
          print('email send');

          String email_data = email.text;
        String mobile_data = mobile.text;
        String password_data = pass.text;
        String name_data = name.text;
        String surname_data = surname.text;
        final user = await FirebaseAuth.instance.currentUser;
          _ref.child(user.uid).set({
            'email':email_data,
            'mobile': mobile_data,
            'name':name_data,
            'surname':surname_data,
            'password':password_data,
            'uid':user.uid
          });
          Navigator.push(context, MaterialPageRoute(builder: (context){return  LogInScreen();}));
        }
        else{
        }
      }catch(e){
        print(e);
      //  Fluttertoast.showToast(msg: "error " + e.toString());
      }
    }
    // signup();
  }

  void showDialogOtpSend() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('OTP sent successfully !'),
            actions: <Widget>[
              RaisedButton(
                  padding: EdgeInsets.only(
                      left: 50.0, right: 50.0, top: 13, bottom: 13),
                  color: Colors.red,
                  splashColor: Colors.white,
                  child: Text('Okay'),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }
  void showMailDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Mail sent successfully !'),
            content: Text('Please verify mail link\n\nAnd Login'),
            actions: <Widget>[
              RaisedButton(
                  padding: EdgeInsets.only(
                      left: 50.0, right: 50.0, top: 13, bottom: 13),
                  color: Colors.red,
                  splashColor: Colors.white,
                  child: Text('Okay'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LogInScreen()));
                  })
            ],
          );
        });
  }

  void showDialogOtpVerify() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('OTP Verified'),
            actions: <Widget>[
              RaisedButton(
                  padding: EdgeInsets.only(
                      left: 50.0, right: 50.0, top: 13, bottom: 13),
                  color: Colors.red,
                  splashColor: Colors.white,
                  child: Text('Okay'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  })
            ],
          );
        });
  }

  void showDialogOtpNotVerify() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('OTP Not Verified'),
            actions: <Widget>[
              RaisedButton(
                  padding: EdgeInsets.only(
                      left: 50.0, right: 50.0, top: 13, bottom: 13),
                  color: Colors.red,
                  splashColor: Colors.white,
                  child: Text('Okay'),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }
  void showDataAdded() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Data Added !'),
            content: Text('Data added successfully in \nRealtime Database\n\nAnd Login'),
            actions: <Widget>[
              RaisedButton(
                  padding: EdgeInsets.only(
                      left: 50.0, right: 50.0, top: 13, bottom: 13),
                  color: Colors.red,
                  splashColor: Colors.white,
                  child: Text('Okay'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LogInScreen()));
                  })
            ],
          );
        });
  }
//  void signup() {
//
//    if (_formKey.currentState.validate()) {
//      setState(() {
//        isLoading = true;
//      });
//      setState(() {
//        autoValidate = false;
//      });
//      FirebaseAuth.instance
//          .createUserWithEmailAndPassword(email: _email, password: _password)
//          .then((user) {
//        // sign up
//        postUserDataToDb();
//      }).catchError((onError) {
//        setState(() {
//          isLoading = false;
//        });
//        //Fluttertoast.showToast(msg: "error " + onError.toString());
//        print('Error code');
//      });
//    } else {
//      setState(() {
//        autoValidate = true;
//      });
//    }
//  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<UserServicesFirebase>(context);
    final ref = FirebaseDatabase.instance.reference().child('SignInDetails');
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('SignUp'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body:  isLoading
          ? Center(child: CircularProgressIndicator())
      :SingleChildScrollView(
        child: Stack(
          overflow: Overflow.clip,
          children: <Widget>[
            Container(
              child: Form(
                key: _formKey,
                //autovalidate: autoValidate,
                child: Column(children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                            height: 170,
                            width: 392,
                            decoration: new BoxDecoration(
                              color: Colors.red,
                              borderRadius: new BorderRadius.vertical(
                                  bottom: new Radius.elliptical(
                                      MediaQuery.of(context).size.width,
                                      170.0)),
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.red,
                              child: CircleAvatar(
                                radius: 70,
                                backgroundColor: Colors.red,
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage(
                                      'https://png.pngtree.com/element_our/sm/20180419/sm_5ad85ccf9cc4d.jpg'),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: 350,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      elevation: 2,
                      child: Column(
                        children: [
                          SizedBox(height: 15),
                          Container(
                              child: Text(
                            'Welcome!!',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontFamily: 'Benne',
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                            ),
                          )),
                          SizedBox(height: 10),
                          Container(
                              alignment: Alignment.center,
                              child: Text(
                                'Please Sign Up',
                                style: TextStyle(
                                  fontSize: 19.0,
                                  fontStyle: FontStyle.normal,
                                ),
                              )),
                          SizedBox(height: 25),
                          Container(
                            height: 85.0,
                            width: 300.0,
                            //padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: TextFormField(
                              controller: email,
                              keyboardType: TextInputType.emailAddress,
                              decoration: design.demo(Icons.email, 'Email'),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Email!';
                                } else if (!value.contains('@')) {
                                  return 'Please Enter Valid Email!';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _email = value;
                              },
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 85.0,
                            width: 300.0,
                            //padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: TextFormField(
                              controller: mobile,
                              keyboardType: TextInputType.number,
                              decoration: design.demo(Icons.mobile_friendly_outlined, 'MobileNo'),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter MobileNo!';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _mobile = value;
                              },
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 85.0,
                            width: 300.0,
                            child: new TextFormField(
                              controller: name,
                              decoration:
                              design.demo(Icons.supervised_user_circle, 'Name'),
                              validator: (value) {
                                if (value.isEmpty || value.length < 4) {
                                  return 'Please Enter Name!';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _name = value;
                              },
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 85.0,
                            width: 300.0,
                            child: new TextFormField(
                              controller: surname,
                              decoration:
                              design.demo(Icons.supervised_user_circle_outlined, 'Surname'),
                              validator: (value) {
                                if (value.isEmpty || value.length < 4) {
                                  return 'Please Enter Surname!';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _surname = value;
                              },
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 85.0,
                            width: 300.0,
                            child: new TextFormField(
                             controller: pass,
                              obscureText: true,
                              keyboardType: TextInputType.number,
                              decoration:
                                  design.demo(Icons.lock_rounded, 'Password'),
                              validator: (value) {
                                if (value.isEmpty || value.length < 4) {
                                  return 'Please Enter Password!';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _pass = value;
                              },
                            ),
                          ),
                          SizedBox(height: 7),
                          Container(
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              padding: EdgeInsets.only(
                                  left: 45.0, right: 45.0, top: 13, bottom: 13),
                              color: Colors.red,
                              splashColor: Colors.white,
                              child: Text(
                                'Sign Up ',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () async {
                                 //_onsubmit();
                                //sendOTP();
//                                   signUp();
                           //   viewModel.saveUser(name.text, surname.text, email.text, mobile.text,pass.text);
                                saveContact();
                                showMailDialog();
//                                _formKey.currentState.save();
//                                final  result = await _auth.createUserWithEmailAndPassword(
//                                    email: email.text, password: pass.text);
//                                if(result != null){
//                                  final user = await FirebaseAuth.instance.currentUser;
//                                  ref.child(user.uid).set({
//                                    'email':_email,
//                                    'mobile': _mobile,
//                                    'name':_name,
//                                    'surname':_surname,
//                                    'password':_pass,
//                                  });
//                                }
                               // showDataAdded();
                            //    Navigator.push(context, MaterialPageRoute(builder: (context) => FatchClgScreen()));
                              },
                            ),
                          ),
                          SizedBox(height: 30),
//                          Container(
//                            height: 85.0,
//                            width: 300.0,
//                            child: new TextFormField(
//                             // controller: otp,
//                              keyboardType: TextInputType.number,
//                              decoration:
//                                  design.demo(Icons.verified_user, 'Enter OTP'),
//                            ),
//                          ),
//                          SizedBox(height: 2),
//                          Container(
//                            child: RaisedButton(
//                              shape: RoundedRectangleBorder(
//                                borderRadius: BorderRadius.circular(25.0),
//                              ),
//                              padding: EdgeInsets.only(
//                                  left: 45.0, right: 45.0, top: 13, bottom: 13),
//                              color: Colors.red,
//                              splashColor: Colors.white,
//                              child: Text(
//                                'Verify OTP ',
//                                style: TextStyle(
//                                  fontSize: 18.0,
//                                  fontWeight: FontWeight.bold,
//                                  color: Colors.white,
//                                ),
//                              ),
//                              onPressed: () {
//                               // verifyOTP();
//                              },
//                            ),
//                          ),
//                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),

                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
