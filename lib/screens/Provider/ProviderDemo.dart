import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app_firebase/screens/Provider/AddDataList.dart';
import 'package:flutter_app_firebase/screens/Provider/AddItemScreen.dart';
import 'package:flutter_app_firebase/screens/Provider/ItemAddNotifier.dart';
import 'package:flutter_app_firebase/screens/Provider/UpdateData.dart';
import 'package:flutter_app_firebase/screens/designscreens/tabView.dart';
import 'package:provider/provider.dart';

class HomeApp extends StatelessWidget {
  int count=0;
  @override
  Widget build(BuildContext context) {
    print('HomeApp COunt====>${count++}');
//    return MultiProvider(
//      providers: [
//        ChangeNotifierProvider<ItemAddNotifier>(create: (BuildContext context) {
//          return ItemAddNotifier();
//        }),
//        ChangeNotifierProvider<ShopNameNotifier>(create: (BuildContext context) {
//          return ShopNameNotifier();
//        }),
//        ChangeNotifierProvider<AddCartModel>(create: (BuildContext context) {
//          return AddCartModel();
//        }),
//        ChangeNotifierProvider<UpdateEmployee>(create: (BuildContext context) {
//          return UpdateEmployee();
//        }),
//      ],
    return ChangeNotifierProvider<ItemAddNotifier>(
        create: (BuildContext context) {
          return ItemAddNotifier();
        },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        color: Colors.greenAccent,
        home: ProviderDemo(),
      ));

  }
}

class ProviderDemo extends StatelessWidget {
  final String title = 'Home';
  int count = 0;

  Widget callCompanyData(){
    print('Count is:CompanyData======>${count++}');
    return Container(
      child: Column(
        children: [
          Consumer<ItemAddNotifier>(

            builder: (context, shopNameNotifier, _) {
              return Text(
                'Store Name: ${shopNameNotifier.shopName}',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget displayData(){
    print('Display Data======>${count++}');
    return Expanded(
      child: Consumer<ItemAddNotifier>(
        builder: (context, itemAddNotifier, _) {
          return Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ListView.builder(
              itemCount: itemAddNotifier.itemList.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.black))),
                  child: ListTile(
                    trailing: IconButton(
                      icon: Icon(Icons.update),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            // fullscreenDialog: true,
                            builder: (context) {
                              return UpdateData();
                            },
                          ),
                        );
                      },
                    ),
                    title: Text(

                      'Employee Name:   ${itemAddNotifier.itemList[index].itemName}',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
//                            subtitle: Text(
//
//                                'Employee Age:   ${itemAddNotifier.itemList[index].itemAge}',
//                                style: TextStyle(
//                                //fontSize: 18.0,
//                                color: Colors.black,
//                              ),
//                            ),
//                            trailing: Icon(Icons.done
//
//                            ),
                    onTap: (){
                      Provider.of<ItemAddNotifier>(context,listen:false).addItemList(
                        itemAddNotifier.itemList[index].itemName,
                        itemAddNotifier.itemList[index].itemAge,
                        itemAddNotifier.itemList[index].itemMail,
                      );
                      SnackBar s = SnackBar(content: Text('${itemAddNotifier.itemList[index].itemName} is Added'),);
                      Scaffold.of(context).showSnackBar(s);
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    print('Main Widget Count is:::==============${count++}');
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:  Color.fromRGBO(150, 170, 105, 5),
        //backgroundColor: Colors.greenAccent,
        title: Text(title),

        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder:(context) {
            return TabView();
          },)),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.supervised_user_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  // fullscreenDialog: true,
                  builder: (context) {
                    return AddDataList();
                  },
                ),
              );
            },
            tooltip: 'Show Employess',
          ),
          IconButton(
            icon: Icon(Icons.add),

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  // fullscreenDialog: true,
                  builder: (context) {
                    return AddItemScreen();
                  },
                ),
              );
            },
            tooltip:'Add Item',
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            Center(
              //child: Count(count++),
            ),
            Container(
              child:Column(
                children: [
                  callCompanyData(),
                 // Text( (count.toString()))
                ],
              ),
              //child:

            ),
//            Consumer<ShopNameNotifier>(
//              builder: (context, shopNameNotifier, _) {
//                return Text(
//                  'Store Name: ${shopNameNotifier.shopName}',
//                  style: TextStyle(
//                      fontSize: 20.0,
//                      color: Colors.black,
//                      fontWeight: FontWeight.bold),
//                );
//              },
//            ),
            SizedBox(
              height: 15.0,
            ),
            Expanded(

              child: displayData(),
            ),
          ],
        ),
      ),
    );
  }
}
