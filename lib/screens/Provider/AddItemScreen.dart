import 'package:flutter/material.dart';
import 'package:flutter_app_firebase/screens/Provider/ItemAddNotifier.dart';

import 'package:provider/provider.dart';

import '../../main.dart';

class AddItemScreen extends StatefulWidget {
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final addInputField = MyApp();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _shopNameController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('Add Widget Call New Screen=====>');
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor:  Color.fromRGBO(150, 170, 105, 5),
        title: Text('Add Item'),
        centerTitle: true,
      ),

      body: Container(
        padding: EdgeInsets.all(40.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            addInputField.input('Shop Name', _shopNameController),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: 150,
              child: RaisedButton(
                color: Colors.blue,
                child: Text(
                  'STORE NAME ',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_shopNameController.text.isEmpty) {
                    return;
                  }
                  Provider.of<ItemAddNotifier>(context, listen: false)
                      .updateShopName(_shopNameController.text);
                },
              ),
            ),
            SizedBox(height: 60.0,),
            addInputField.input('Enter Name', _nameController),
            SizedBox(height: 17.0,),
            addInputField.input('Enter Age', _ageController),
            SizedBox(height: 17.0,),
            addInputField.input('Enter E-Mail', _mailController),
            SizedBox(height: 20.0,),
            Container(
              width: 150,
              child: RaisedButton(
                color: Colors.blue,
                child: Text(
                  'ADD EMPLOYEES',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_nameController.text.isEmpty ||
                      _ageController.text.isEmpty ||
                      _mailController.text.isEmpty) {
                    return;
                  }
                  Provider.of<ItemAddNotifier>(context, listen: false).addItem(
                      _nameController.text,
                      _ageController.text,
                      _mailController.text);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
