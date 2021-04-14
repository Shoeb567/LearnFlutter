import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_firebase/models/authentication.dart';
import 'package:flutter_app_firebase/screens/cldScreene/fatchclgscreen.dart';
import 'package:flutter_app_firebase/screens/decoratescreen.dart';
import 'package:flutter_app_firebase/screens/designscreens/tabView.dart';
import 'package:flutter_app_firebase/screens/homescreen.dart';
import 'package:flutter_app_firebase/screens/signinscreen.dart';
//import 'package:provider/provider.dart';

void main() {}

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key key}) : super(key: key);
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {

  SignInScreen data = SignInScreen();
  final auth = FirebaseAuth.instance;
  String _email, _password;
  Future logIn() async {
    _formKey.currentState.save();
    try {
      final user = await auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      if (user.user.emailVerified) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        print('Email verified');
      }
      else{
        print('Email not verified');
        _showErrorDialog();
      }
    } catch (e) {
      print(e);
    }
  }


  var _formKey = GlobalKey<FormState>();
  var design = DecorateScreen();
  Future logInVerification() async {
    _formKey.currentState.save();
    try {
      final user = await auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      if (user.user.emailVerified) {

        Navigator.push(context, MaterialPageRoute(builder: (context) => FatchScreen()));
        print('Email verified');
      }
      else{
        print('Email not verified');
        _showErrorDialog();
      }
    } catch (e) {
      print(e);
    }
  }
//  Map<String, String> _authData = {'email': '', 'passsword': ''};
//
//  Future<void> _onsubmit() async {
//    if (!_formKey.currentState.validate()) {
//      return;
//    }
//    _formKey.currentState.save();
//    try {
//      await Provider.of<Authentication>(context, listen: false)
//          .logIn(_authData['email'], _authData['password']);
//
//      Navigator.push(
//          context, MaterialPageRoute(builder: (context) => HomeScreen()));
//    } catch (error) {
//      _showErrorDialog();
//    }
//  }

  void _showErrorDialog() {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('Error'),
              content: Text(
                'Please Verify Email.\n\n Or New User.\n\nPlease SignUp',
              ),
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
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      //resizeToAvoidBottomInset: true,
      body: Container(
        // margin: EdgeInsets.only(top: 190),

        child: Stack(
          overflow: Overflow.clip,
          children: <Widget>[
            Positioned(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    padding: EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 13, bottom: 13),
                    color: Colors.red,
                    splashColor: Colors.white,
                    child: Text(
                      'New User?Please Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Benne',
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShowSignInScreen()));
                    }),
              ),
            ),
            Container(
              child: Form(
                autovalidate: true,
                key: _formKey,
                child: Column(children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                            height: 230,
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
                  SizedBox(height: 30),
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
                            'Login In to Continue',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                            ),
                          )),
                          SizedBox(height: 45),
                          Container(
                            height: 85.0,
                            width: 300.0,
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: design.demo(Icons.email, 'Email'),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Email!';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                //_authData['email'] = value;
                                _email = value;
                              },
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            height: 85.0,
                            width: 300.0,
                            child: new TextFormField(
                              keyboardType: TextInputType.number,
                              obscureText: true,
                              decoration: design.demo(Icons.lock_rounded, 'Password'),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Password!';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                //_authData['password'] = value;
                                _password = value;
                              },
                            ),
                          ),
                          SizedBox(height: 23),
                          Container(
                            decoration: new BoxDecoration(
                              color: Colors.red,
                              border: new Border.all(color: Colors.red),
                              borderRadius: new BorderRadius.circular(25.0),
                            ),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              padding: EdgeInsets.only(
                                  left: 50.0, right: 50.0, top: 11, bottom: 11),
                              color: Colors.red,
                              splashColor: Colors.white,
                              child: Text(
                                'Login In ',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: 'Benne',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  //   backgroundColor: Colors.black,
                                ),
                              ),
                              onPressed: () {
                             //   logIn();
                                logInVerification();

                              },
                            ),
                          ),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),


                  SizedBox(height: 48),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
//                      Container(
//                        child: RaisedButton.icon(
//                          onPressed: () {
//                            googlesignin().whenComplete(() =>
//                                Navigator.of(context).pushReplacement(
//                                    MaterialPageRoute(
//                                        builder: (context) => HomeScreen())));
//                            print('Button Clicked.');
//                          },
//                          shape: RoundedRectangleBorder(
//                              borderRadius:
//                                  BorderRadius.all(Radius.circular(10.0))),
//                          label: Text(
//                            'Signin with Google',
//                            style: TextStyle(color: Colors.white),
//                          ),
//                          icon: Icon(
//                            Icons.no_encryption_gmailerrorred_outlined,
//                            color: Colors.white,
//                          ),
//                          textColor: Colors.white,
//                          splashColor: Colors.red,
//                          color: Colors.red,
//                        ),
//                      ),
//                      Container(
//                        width: 200,
//                        height: 100,
////                        decoration: new BoxDecoration(
////                          color: Colors.white,
////                          border: new Border.all(color: Colors.white),
////                          borderRadius: new BorderRadius.circular(25.0),
////                        ),
////                        child: RaisedButton(
////                          shape: RoundedRectangleBorder(
////                            borderRadius: BorderRadius.circular(25.0),
////                          ),
//////                          padding: EdgeInsets.only(
//////                              left: 70.0, right: 55.0, top: 13, bottom: 13),
////                          color: Colors.red,
////                          splashColor: Colors.white,
////                          child: Text(
////                            'Login In with Facebook',
////                            style: TextStyle(
////                              fontSize: 11.0,
////                              fontWeight: FontWeight.bold,
////                              color: Colors.white,
////                              //   backgroundColor: Colors.black,
////                            ),
////                          ),
////                          onPressed: () {
////                            // _onsubmit();
////                          },
////                        ),
//                      child:  Image.network("https://res.cloudinary.com/practicaldev/image/fetch/s--uykAHSh8--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/i/u3e0jxnva6te9a3kx5ji.png"),
//                      ),
                      Material(
                          child: InkWell(
                            onTap: () {
//                              googlesignin().whenComplete(() =>
//                                  Navigator.of(context).pushReplacement(
//                                      MaterialPageRoute(
//                                          builder: (context) => HomeScreen())));
//                              print('Button Clicked.');
                            },
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEUH7d4JY92rFYkbSC3p3tzXIhIwS7NF9Iw5VNGlIwB2uCtp0gTER_ZdJtphzBaRA0vA&usqp=CAU',
                                    width: 150.0, height: 50.0),
                              ),),
                          )
                      ),
                      Material(
                          child: InkWell(
                            onTap: () {
//                              googlesignin().whenComplete(() =>
//                                  Navigator.of(context).pushReplacement(
//                                      MaterialPageRoute(
//                                          builder: (context) => HomeScreen())));
//                              print('Button Clicked.');
                            },
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.network('https://img.pngio.com/fb-login-button-png-4-png-image-facebook-login-button-png-600_145.png',
                                    width: 150.0, height: 50.0),
                              ),),
                          )
                      )
                    ],
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
