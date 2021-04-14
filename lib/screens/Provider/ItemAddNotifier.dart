import 'package:flutter/material.dart';
class Item {
  String itemName,itemAge,itemMail;
  Item(this.itemName,this.itemAge,this.itemMail);
}

class ItemAddNotifier extends ChangeNotifier {

  List<Item> itemList = [];
  addItem(String itemName, String age ,String mail) async {
    Item item = Item(itemName,age,mail);
    itemList.add(item);
    notifyListeners();
  }

  String shopName = '';
  updateShopName(String shopName) async {
    this.shopName = shopName;
    notifyListeners();
  }


  List<String> _selectedName = [];
  List<String> get selectedName  => _selectedName;
  addItemList(String itemName, String age,String mail) async {
    //Item item = Item(itemName,age);
    //selectedName.add('Name:   ${itemName}\nAge:      ${age}\nMail:      ${mail}');
    if(selectedName.isEmpty ){
      return selectedName.add('Name:     $itemName\nAge:         $age\nE-Mail:      $mail');
    }
    else if(selectedName.isNotEmpty ){
      return {{selectedName.clear()}, {selectedName.add('Name:     $itemName\nAge:         $age\nE-Mail:      $mail')}};
    }
  }
  notifyListeners();
}
//
//class ShopNameNotifier extends ChangeNotifier {
//
//  String shopName = '';
//  updateShopName(String shopName) async {
//    this.shopName = shopName;
//    notifyListeners();
//  }
//}
//
//class AddCartModel extends ChangeNotifier{
//  List<String> _selectedName = [];
//  List<String> get selectedName  => _selectedName;
//   addItemList(String itemName, String age,String mail) async {
//    //Item item = Item(itemName,age);
//   //selectedName.add('Name:   ${itemName}\nAge:      ${age}\nMail:      ${mail}');
//    if(selectedName.isEmpty ){
//      return selectedName.add('Name:     $itemName\nAge:         $age\nE-Mail:      $mail');
//    }
//    else if(selectedName.isNotEmpty ){
//      return {{selectedName.clear()}, {selectedName.add('Name:     $itemName\nAge:         $age\nE-Mail:      $mail')}};
//    }
//  }
//  notifyListeners();
//}

class Count extends StatelessWidget {
  final int count;
  Count(this.count);
  @override
  Widget build(BuildContext context) {
    return Text("$count");
  }
}

class UpdateEmployee extends ChangeNotifier {

  String name = '';
  String age = '';
  String mail = '';
  updateEmployee(String name,String age,String mail) async {
    this.name = name;
    this.age = age;
    this.mail = mail;
    notifyListeners();
  }
}