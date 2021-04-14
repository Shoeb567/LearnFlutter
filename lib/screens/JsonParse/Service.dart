import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Users.dart';

class Services{

  static const String url =('https://unpkg.com/country-flag-emoji-json@1.0.2/json/flag-emojis.pretty.json');

  static Future<List<User>> getUsers() async{
    try{
      final response = await http.get(url);
      if(200 == response.statusCode){
        final List<User> users = userFromJson(response.body);
        return users;
      }
      else{
        //return List<User>();
        throw Exception('Can;t Find Data');
      }
    }
    catch(e){
      return List<User>();
    }
  }
}