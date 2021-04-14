import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {}

class ListViewDemo extends StatefulWidget {
  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class Data {
  List<String> list = [];
  List<String> listGender = [];
  String username, college, date;

  String number;
  int index1;

  Data({this.username, this.date, this.college, List list,List gender,this.number, this.index1}) {
    this.list = list;
    this.listGender = gender;
  }
}

//class NumberList {
//  String number;
//  int index;
//
//  NumberList({this.number, this.index});
//}
class _ListViewDemoState extends State<ListViewDemo> {
  List<Data> list = [];
  final formKey = GlobalKey<FormState>();

  TextEditingController username = new TextEditingController();
  TextEditingController dateText = new TextEditingController();
  TextEditingController college = new TextEditingController();

  Map<String, bool> values = {
    'Cricket': false,
    'Chess': false,
    'Football': false,
  };
  Map<String, bool> gendervalues = {
    'Male': false,
    'Female': false,

  };
  List<String> tmpArray = [];

  List<Data> genderList =[];
  List<String> tmpGenderArray1 = [];
  String radioItemHolder = '';
  int id = 1;
  List<Data> tmpGenderArray =[
    Data(
      index1: 1,
      number: "Male",
    ),
    Data(
      index1: 2,
      number: "Female",
    ),
  ];

  onSubmit() {
    print('TempArray${tmpArray}');
    //print(''${tmpGenderArray1}');
    var form = formKey.currentState;

    if (form.validate()) {
      form.save();
      list.add(Data(
          username: username.text,
          date: dateText.text,
          college: college.text,
          list: tmpArray.toList(),
          gender: tmpGenderArray1.toList()
      ));
      values = {
        'Cricket': false,
        'Chess': false,
        'Football': false,
      };
      tmpArray.clear();
      list.forEach((element) {
        element.list.forEach((element) {});
      });

      gendervalues = {
        'Male': false,
        'Female': false,
      };
      // tmpGenderArray1.clear();
      genderList.forEach((element) {
        element.listGender.forEach((element) {});
      });

    }
  }

  textStyle() {
    return TextStyle(
      fontSize: 16.0,
      //fontFamily: 'Benne',
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      //decorationStyle: TextDecorationStyle.dotted,
    );
  }

  focusborder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue, width: 1.0),
      borderRadius: BorderRadius.circular(10.0),
    );
  }

  outlineborder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(9.0)),
    );
  }

  hint() {
    return TextStyle(
      color: Colors.brown,
      fontWeight: FontWeight.bold,
      fontSize: 13,
    );
  }

  DateTime date = DateTime.now();

  Future<Null> selectTimePicker(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
//        dateText.text = DateFormat('dd/ MMMM/ yyyy').format(date);
        dateText.text = "${date.day}/${date.month}/${date.year}";
      });
    }
  }



//  List<NumberList> nList = [
//    NumberList(
//      index: 1,
//      number: "Male",
//    ),
//    NumberList(
//      index: 2,
//      number: "Female",
//    ),
//  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
//        appBar: AppBar(
//          title: Center(
//            //child: Text('ListView Demo'),
//          ),
//          centerTitle: true,
//        ),
        body: Container(
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    width: 270,
                    height: 60,
                    child: TextFormField(
                      controller: username,
                      validator: (val) =>
                      (val.length == 0 ? 'Please Enter Username' : null),
                      decoration: InputDecoration(
                        focusedBorder: focusborder(),
                        enabledBorder: outlineborder(),
                        errorBorder: focusborder(),
                        focusedErrorBorder: focusborder(),
                        hintText: 'Username',
                        prefixIcon: Icon(
                          Icons.person,
                          size: 18.0,
                          color: Colors.black,
                        ),
                        hintStyle: hint(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Container(
                    //color: Colors.red,
                    width: 270,
                    height: 60,
                    child: TextFormField(
                      controller: dateText,
                      onTap: (() {
                        selectTimePicker(context);
                      }),
                      validator: (val) =>
                      (val.length == 0 ? 'Please Enter BirthDate' : null),
                      decoration: InputDecoration(
                        focusedBorder: focusborder(),
                        enabledBorder: outlineborder(),
                        errorBorder: focusborder(),
                        focusedErrorBorder: focusborder(),
                        hintText: 'Enter BirthDate',
                        prefixIcon: IconButton(
                          icon: Icon(
                            Icons.date_range,
                            size: 18.0,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            selectTimePicker(context);
                          },
                        ),
                        hintStyle: hint(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Container(
                    //color: Colors.red,
                    width: 270,
                    height: 60,
                    child: TextFormField(
                      controller: college,
                      validator: (val) =>
                      (val.length == 0 ? 'Please Enter College' : null),
                      decoration: InputDecoration(
                        focusedBorder: focusborder(),
                        enabledBorder: outlineborder(),
                        errorBorder: focusborder(),
                        focusedErrorBorder: focusborder(),
                        hintText: 'College',
                        prefixIcon: Icon(
                          Icons.school,
                          size: 18.0,
                          color: Colors.black,
                        ),
                        hintStyle: hint(),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Text('Hobbies:', style: textStyle()),
                ),
                Center(
                  child: Column(
                    children: values.keys.map((String key) {
                      return CheckboxListTile(
                        title: new Text(key),
                        subtitle: const Text('I Like This'),
                        secondary: const Icon(Icons.code),
                        value: values[key] == true,
                        activeColor: Colors.pink,
                        checkColor: Colors.white,
                        onChanged: (bool value) => setState(() {
                          values[key] = value;
                          if (value == true && !tmpArray.contains(key)) {
                            tmpArray.add(key);
                          } else {
                            if (tmpArray.contains(key)) {
                              tmpArray.remove(key);
                            }
                          }
                        }),
                      );
                    }).toList(),
                  ),
                ),

                Center(
                  child: RaisedButton(
                    color: Colors.blue,
                    splashColor: Colors.white,
                    onPressed: () {
                      setState(() {
                        onSubmit();
                      });
                    },
                    child: Text('Add Data'),
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.black,
                      ),
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                                color: Colors.black45,
                                width: 2
                            ),
                          ),
                          color: Colors.cyanAccent,
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,

                                child: ListTile(
                                  leading: Icon(
                                      Icons.admin_panel_settings_sharp,
                                      color: Colors.blueAccent,
                                      size: 30),
                                  trailing: Icon(Icons.arrow_forward, size: 25),
                                  title: Text('Name:${list[index].username}',
                                      style: textStyle()),
                                  subtitle: Text(
                                    'BirthDate:${list[index].date} \n'
                                        'College:${list[index].college} \n'
                                        'Hobbies:${list[index].list}\n'
                                    // 'Gender:${genderList[id].listGender}\n',
                                    ,style: hint(),
                                  ),
                                  isThreeLine: true,
                                  onTap: () {},
                                  onLongPress: () {},
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0.0, horizontal: 14.0),
                                  dense: true,
                                  focusColor: Colors.greenAccent,
                                ),
                              ),

                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
