import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final formKey = GlobalKey<FormState>();
  String _user;
  String _mail;
  String _birth;
  String _contact;

  bool _validate = false;

  var username = new TextEditingController();
  var mail = new TextEditingController();
  var birth = new TextEditingController();
  var contact = new TextEditingController();

  textStyle() {
    return TextStyle(
      fontSize: 20.0,
      fontFamily: 'Benne',
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      //decorationStyle: TextDecorationStyle.dotted,
    );
  }

  focusborder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue, width: 1.0),
      borderRadius: BorderRadius.circular(5.0),
    );
  }

  outlineborder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    );
  }

  hint() {
    return TextStyle(
      color: Colors.brown,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
  }

  int _radioValue = 0;
  String _radioResult = '';
  int _result = 0;

  void radioValue(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          _radioResult = 'Male';
          break;
        case 1:
          _radioResult = 'Female';
          break;
      }
    });
  }

  bool cricket = false;
  bool tennis = false;
  int value = 1;
bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
//      appBar: AppBar(
//        backgroundColor: Colors.blueAccent,
//        title: (Text('Registration Form')),
//        centerTitle: true,
//        //automaticallyImplyLeading: false,
//      ),
      body:
      isLoading
          ? Center(child: CircularProgressIndicator())
          :SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Align(
              //alignment: Alignment.topCenter,

              child: Text('Welcome',
                  style: TextStyle(
                    height: 3,
                    fontSize: 25.0,
                    fontFamily: 'Benne',
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    //decorationStyle: TextDecorationStyle.dotted,
                  )),
            ),
            SizedBox(height: 10),
            Container(
              child: Column(
                children: [

                  Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          //height: 80,
                          // color: Colors.yellow,
                          //width: 30,
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 140,
                                margin: EdgeInsets.only(left: 10),
                                child: Text('Username:', style: textStyle()),
                              ),
                              Container(
                                //color: Colors.red,
                                width: 230,
                                height: 80,
                                child: TextFormField(
                                  controller: username,
                                  decoration: InputDecoration(
                                    focusedBorder: focusborder(),
                                    enabledBorder: outlineborder(),
                                    errorBorder: focusborder(),
                                    focusedErrorBorder: focusborder(),
                                    hintText: 'Enter Username',
                                    prefixIcon: Icon(
                                      Icons.person,
                                      size: 25.0,
                                      color: Colors.black,
                                    ),
                                    hintStyle: hint(),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please Enter Username!';
                                    }
                                    return null;
                                  },
                                  onSaved: (validUser) {
                                    _user = validUser;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 2),
                        Container(
                          //width: 30,
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                width: 140,
                                child: Text('Email:', style: textStyle()),
                              ),
                              Container(
                                width: 230,
                                height: 80,
                                child: TextFormField(
                                  controller: mail,
                                  decoration: InputDecoration(
                                    focusedBorder: focusborder(),
                                    enabledBorder: outlineborder(),
                                    errorBorder: focusborder(),
                                    focusedErrorBorder: focusborder(),
                                    hintText: 'Enter Email',
                                    hintStyle: hint(),
                                    prefixIcon: Icon(
                                      Icons.mail_outline_rounded,
                                      size: 25.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please Enter Email!';
                                    }
                                    if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                                     return "Please Enter Valid Mail";
                                    }
                                    return null;
                                  },
                                  onSaved: (validEmail) {
                                    _mail = validEmail;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 2),
                        Container(
                          //width: 30,
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                width: 140,
                                child: Text('BirthDate:', style: textStyle()),
                              ),
                              Container(
                                width: 230,
                                height: 80,
                                child: TextFormField(
                                  controller: birth,
                                  keyboardType: TextInputType.datetime,
                                  decoration: InputDecoration(
                                    focusedBorder: focusborder(),
                                    enabledBorder: outlineborder(),
                                    errorBorder: focusborder(),
                                    focusedErrorBorder: focusborder(),
                                    hintText: '_ _/_ _/_ _ _ _',
                                    hintStyle: hint(),
                                    prefixIcon: Icon(
                                      Icons.cake_rounded,
                                      size: 25.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please Enter Birthdate!';
                                    }
                                    return null;
                                  },
                                  onSaved: (validbirth) {
                                    _birth = validbirth;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          //width: 30,
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                width: 140,
                                child: Text('Gender:', style: textStyle()),
                              ),
                              Container(
                                width: 230,
                                height: 80,
                                child: Row(
                                  children: <Widget>[
                                    new Radio(
                                      activeColor: Colors.blue,
                                      value: 1,
                                      groupValue: _radioValue,
                                      onChanged: radioValue,
                                    ),
                                    new Text('Male', style: hint()),
                                    Radio(
                                      activeColor: Colors.blue,
                                      value: 2,
                                      groupValue: _radioValue,
                                      onChanged: radioValue,
                                    ),
                                    new Text('Female', style: hint()),
                                    //                              validator: (value) {
                                  ],
                                ),

                              ),
                            ],
                          ),
                        ),
                        Container(
                          //width: 30,
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                width: 140,
                                child: Text('Hobbies:', style: textStyle()),
                              ),
                              Container(
                                width: 230,
                                height: 80,
                                child: Row(
                                  children: <Widget>[
                                    Checkbox(
                                      // checkColor: Colors.greenAccent,
                                      activeColor: Colors.blue,
                                      value: this.cricket,
                                      onChanged: (bool value) {
                                        setState(() {
                                          this.cricket = value;
                                        });
                                      },
                                    ),
                                    Text('Cricket', style: hint()),
                                    Checkbox(

                                      //checkColor: Colors.greenAccent,
                                      activeColor: Colors.blue,

                                      value: this.tennis,
                                      onChanged: (bool value) {
                                        setState(() {
                                          this.tennis = value;
                                        });
                                      },
                                    ),
                                    Text('Tennis', style: hint()),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          //width: 30,
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                width: 140,
                                child: Text('Stream:', style: textStyle()),
                              ),
                              Container(
                                width: 230,
                                height: 70,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 230,

                                      child: DecoratedBox(
                                              decoration: ShapeDecoration(
                                              //color: Colors.cyan,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(width: 2.0, style: BorderStyle.solid,color: Colors.blue),
                                                borderRadius: BorderRadius.all(Radius.circular(10.0)),

                                              )
                                              ),
                                        child: DropdownButtonFormField(
                                            validator: (value) => value == null
                                                ? 'Please Enter Area' : null,

                                            iconEnabledColor: Colors.white,
                                            hint: Text('Select AnyOne'),
                                            icon: Icon(                // Add this
                                              Icons.arrow_drop_down,  // Add this
                                              color: Colors.blue,
                                              size: 40,
                                              // Add this
                                            ),

                                            value: value,
                                            items: [
                                              DropdownMenuItem(

                                                child: Text("Select Anyone",style: hint(),),
                                                value: 1,
                                              ),
                                              DropdownMenuItem(
                                                child: Text("BCA"),
                                                value: 2,
                                              ),
                                              DropdownMenuItem(
                                                child: Text("BBA"),
                                                value: 3,
                                              ),
                                              DropdownMenuItem(
                                                child: Text("MBA"),
                                                value: 4,
                                              ),
                                            ],
                                            onChanged: (value1) {
                                              setState(() {
                                                value = value1;
                                              });
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          //width: 30,
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                width: 140,
                                child: Text('Contact:', style: textStyle()),
                              ),
                              Container(
                                width: 230,
                                height: 80,
                                child: TextFormField(
                                  controller: contact,
                                  keyboardType: TextInputType.datetime,
                                  decoration: InputDecoration(
                                    focusedBorder: focusborder(),
                                    enabledBorder: outlineborder(),
                                    errorBorder: focusborder(),
                                    focusedErrorBorder: focusborder(),
                                    hintText: 'Enter MobileNo',
                                    hintStyle: hint(),
                                    prefixIcon: Icon(
                                      Icons.mobile_friendly,
                                      size: 25.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please Enter MobileNo!';
                                    }
                                    if(value.length<10)
                                      {
                                        return 'Please Enter Valid MobileNo!';
                                      }
                                    return null;
                                  },
                                  onSaved: (validcontact) {
                                    _contact = validcontact;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 50),
                        Container(
                            //width: 30,
                            decoration: new BoxDecoration(
                              color: Colors.blue,
                              border: new Border.all(color: Colors.blue),
                              borderRadius: new BorderRadius.circular(5.0),
                            ),
                            child: RaisedButton(
                                color: Colors.blue,
                                splashColor: Colors.white,
                                onPressed: () {
                                  if (formKey.currentState.validate()) {
                                    var enteruser = username.text;
                                    var entermail = mail.text;
                                    var enterbirth = birth.text;
                                    var entercontact = contact.text;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegistrationFormData(
                                                    getuser: enteruser,
                                                    getmail: entermail,
                                                    getbirth: enterbirth,
                                                getcontact:entercontact)));
                                  } else {
                                    print("Login Unsuccessful");
                                  }
                                },
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontFamily: 'Benne',
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                    //decorationStyle: TextDecorationStyle.dotted,
                                  ),
                                ))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListItem {
  String name;

  ListItem(this.name);
}

Future gotoLogin(context) {
//  Navigator.push(
//      context, MaterialPageRoute(builder: (context) => LogInScreen()));
}

class RegistrationFormData extends StatelessWidget {
  final getuser, getmail, getbirth,getcontact;

  RegistrationFormData({
    @required this.getuser,
    @required this.getmail,
    @required this.getbirth,
    @required this.getcontact,
  });

  textStyle() {
    return TextStyle(
      fontSize: 18.0,

     // fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      //decorationStyle: TextDecorationStyle.dotted,
    );
  }
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor:  Color.fromRGBO(150, 170, 105, 5),
        title: (Text('Welcome',
            style: TextStyle(
              fontSize: 23.0,
              fontFamily: 'Benne',
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              //decorationStyle: TextDecorationStyle.dotted,
            ))),
        centerTitle: true,
        //automaticallyImplyLeading: false,
      ),
      body:
         Container(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 40),
                Text('User Details',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'Benne',
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      //decorationStyle: TextDecorationStyle.dotted,
                    )),
                SizedBox(height: 20),

                    Text('Username :$getuser', style: textStyle(),),


                SizedBox(height: 15),
                Text('Email:$getmail', style: textStyle()),
                SizedBox(height: 15),
                Text('BirthDate:$getbirth', style: textStyle()),
                SizedBox(height: 15),
                Text('ContactNo:$getcontact', style: textStyle()),
              ],
            ),
          ),
        ),

    );
  }
}
