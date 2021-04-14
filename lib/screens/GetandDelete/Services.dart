import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'classUser.dart';
import 'dart:convert';

class Services {
  static const String url = ('https://gorest.co.in/public-api/users');

     Future<UserModel> getUsers() async {
    final response = await http.get(url);

    if (200 == response.statusCode) {
     return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Can't Find Data");
    }
  }

  static Future<UserModel> deleteAuthor(String id) async {
    final Response response = await delete('$url/$id',
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        });

    if (response.statusCode == 200) {
      print('Delete Data');
      UserModel.fromJson(jsonDecode(response.body));
      print('Response:${response.body}');
    } else {
      throw Exception("Can't Delete");
    }
  }
}

