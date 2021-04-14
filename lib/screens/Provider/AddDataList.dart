import 'package:flutter/material.dart';
import 'package:flutter_app_firebase/screens/Provider/ItemAddNotifier.dart';
import 'package:flutter_app_firebase/screens/Provider/ProviderDemo.dart';

import 'package:provider/provider.dart';

class AddDataList extends StatelessWidget {
  final String title = 'Show CustomerList';

  get selectedName => null;

//
//  List<String> _selectedName = [];
//  List<String> get selectedName  => _selectedName;
//  void addItemList(String itemName, String age) async {
//    //Item item = Item(itemName,age);
//    selectedName.add('Name:   ${itemName}\nAge:      ${age}');
//
//  }

  Widget refreshBg() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20.0),
      color: Colors.red,
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }

//  @override
//  void initState(){
//    //items = new List();
//    for(int index = 0; index < selectedName.length; index++){
//
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        //backgroundColor: Colors.greenAccent,
        title: Text(title),
        backgroundColor:  Color.fromRGBO(150, 170, 105, 5),
        centerTitle: true,
        leading:  IconButton(
         icon: new Icon(Icons.arrow_back),
          onPressed: () {
            //cart.selectedName.clear();
            Navigator.push(
              context,
              MaterialPageRoute(
                // fullscreenDialog: true,
                builder: (context) {
                  return ProviderDemo();
                },
              ),
            );
          },
      ),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            Container(
              child: Consumer<ItemAddNotifier>(
                builder: (context, shopNameNotifier, _) {
                  return Text(
                    ' ${shopNameNotifier.shopName}',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  );
                },
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Expanded(
              child: Consumer<ItemAddNotifier>(
                builder: (context, cart, _) {
                  return Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListView.builder(
                      itemCount: cart.selectedName.length,
                      itemBuilder: (context, index) {
                        return Container(


                          child: Column(
                            children: [

                             Dismissible(
                                background: refreshBg(),
                                key: Key(cart.selectedName[index]),
                                onDismissed: (direction) {
                                  print('Code work');
                                  cart.selectedName.removeAt(index);
                                  SnackBar s = SnackBar(
                                    content: Text(
                                        '${cart.selectedName[index]} is removed'),
                                  );
                                  Scaffold.of(context).showSnackBar(s);
                                },
                                child: Column(
                                  children: [
                                    Text('Employee Details',style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                    SizedBox(height:25),
                                    Container(

                                      decoration: BoxDecoration(
//                                          border: Border(
//                                              bottom: BorderSide(color: Colors.black))
                                      ),
                                      child: ListTile(
                                        title: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            cart.selectedName[index],
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),


//                            subtitle: Text(
//                              cart.selectedName[index],
//                              style: TextStyle(
//                                //fontSize: 18.0,
//                                color: Colors.black,
//                              ),
//                            ),

                                      ),
                                    ),
                                  ],
                                )),
                          ]),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
