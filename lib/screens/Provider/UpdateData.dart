import 'package:flutter/material.dart';
import 'package:flutter_app_firebase/screens/Provider/ItemAddNotifier.dart';
import 'package:flutter_app_firebase/screens/Provider/ProviderDemo.dart';
import 'package:provider/provider.dart';

class UpdateData extends StatefulWidget {
  @override
  _UpdateDataState createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _shopNameController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Update Item'),
        centerTitle: true,
      ),
      backgroundColor:  Color.fromRGBO(150, 170, 105, 5),
      body: Container(
        padding: EdgeInsets.all(40.0),

        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(
              height: 20.0,
            ),

            SizedBox(
              height: 60.0,
            ),
            TextField(

              controller: _nameController,
              decoration: InputDecoration(
                focusedBorder: focusborder(),
                enabledBorder: outlineborder(),
                hintText: 'Enter Name',
                contentPadding: EdgeInsets.all(15.0),

              ),
            ),
            SizedBox(
              height: 17.0,
            ),
            TextField(

              controller: _ageController,
              decoration: InputDecoration(

                contentPadding: EdgeInsets.all(15.0),
                focusedBorder: focusborder(),
                enabledBorder: outlineborder(),
                hintText: 'Enter Age',
              ),
            ),
            SizedBox(
              height: 17.0,
            ),
            TextField(

              controller: _mailController,
              decoration: InputDecoration(
                focusedBorder: focusborder(),
                enabledBorder: outlineborder(),
                hintText: 'Enter Email',
                contentPadding: EdgeInsets.all(15.0),

              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: 150,
              child: RaisedButton(
                color: Colors.blue,
                child: Text('UPDATE EMPLOYEE ',style: TextStyle(color: Colors.white),),
                onPressed: () async {
                  if (_nameController.text.isEmpty || _ageController.text.isEmpty || _mailController.text.isEmpty) {
                    return;
                  }
                  Provider.of<UpdateEmployee>(context, listen: false)
                      .updateEmployee(_nameController.text,_ageController.text,_mailController.text);
                  Navigator.push(context, MaterialPageRoute(builder: (context) { return HomeApp();}));
                },
              ),
            ),


          ],
        ),
      ),
    );
  }
}

