import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp1/user_model.dart';

Future<UserModel> getwaetherdata() async {
  // print("----->>>>");
  var weatherdata = [];
  var baseurl =
      'https://api.openweathermap.org/data/2.5/weather?q=karachi&appid=f5783e1fee68d6228723ecc46804ee40';
  // print("kjsdnjkldsnjkds");
  var url = Uri.parse(baseurl);
  var res = await http.get(url);
  // print(res);
  // var jsonres =  jsonDecode(res.body);
  // print("zlkcidlksdkld");

  // weatherdata.add(UserModel.fromJson(jsonres));
  UserModel modelData = UserModel.fromJson(jsonDecode(res.body));
  // print(modelData);
  // print(res.statusCode);
  // print(res.body);
  return modelData;
}
