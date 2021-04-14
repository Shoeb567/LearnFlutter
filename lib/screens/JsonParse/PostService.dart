import 'dart:convert';

import 'package:http/http.dart' as http;
import 'Users.dart';
import 'PostApiClass.dart';

Future<UserData> fetchPosts(String num) async {
  final response =
  await http.get('https://jsonplaceholder.typicode.com/users/${num}');

  if (response.statusCode == 200) {
    return UserData.fromJson(json.decode(response.body));
  } else {

    throw Exception("Can't Find Data");
  }
}
