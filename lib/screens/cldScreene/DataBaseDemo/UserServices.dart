
import 'package:flutter/material.dart';
import 'package:flutter_app_firebase/screens/cldScreene/DataBaseDemo/DBHelper.dart';
import 'package:flutter_app_firebase/screens/cldScreene/DataBaseDemo/User.dart';
import 'package:provider/provider.dart';

class UserServices extends ChangeNotifier {
  List<User> users = [];
  List<User> search = [];

  UserServices()
  {
    fetchUsers();
  }
  searchData(str) async {

    search.clear();
    await users.forEach((element) {
      if (element.name.toLowerCase().contains(str.toLowerCase()))
        search.add(element);
    });
    notifyListeners();
    print('User List:${users.length}');
    print('Search List:${search.length}');
  }

  void saveUser(String name, int age) async{
    await DBHelper.insert(

        'users', {'id': DateTime.now().toString(),
                    'name': name,
                    'age': age});
    await fetchUsers();
    //notifyListeners();
  }

  Future<List<User>> fetchUsers() async {

    final usersList = await DBHelper.getData('users');
     users = usersList
        .map((item) =>
            User(id: item['id'], name: item['name'], age: item['age']))
        .toList();
     search=users.toList();
    notifyListeners();
//    print('User List:${users.length}');
//    print('Search List:${search.length}');
  }

  void deleteUser(String id) {
    DBHelper.deleteData('users', id);
    fetchUsers();
   // notifyListeners();
  }

  void updateUser(String id, String name, int age) async{
    DBHelper.updateData('users', id,
        {'id': DateTime.now().toString(), 'name': name, 'age': age});
    await fetchUsers();
   // notifyListeners();
  }
}
