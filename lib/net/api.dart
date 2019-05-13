import 'dart:async';
import 'dart:convert' show json;

import 'package:flutter_qyt/models/login.dart';
import 'package:flutter_qyt/net/http.dart';

Future<Login> login(Map<String, String> data) async {
  var response = await getJson('user/login', data);
  return Login.fromJson(response);
}
