import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../constraint/error_code.dart';
import '../constraint/api_urls.dart';
import '../entity/response/LoginResponse.dart';
import '../entity/response/StaffResponse.dart';
import '../entity/api_exception.dart';

class AuthAPI{

  static Future<bool> login(BuildContext context, String email, String password) async {
    Map<String, dynamic> myJson = {
      "username": email,
      "password": password
    };

    var url = URLs().LOGIN;
    var body = jsonEncode(myJson);

    var response = await http.post(url, body: body, headers: {"Content-Type": "application/json"});

    var jsonResponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      LoginResponse loginResponse = LoginResponse.fromJson(jsonResponse);
      var token = loginResponse.result!.token;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token!);

      return true;
    } else if (jsonResponse['code'] == ErrorCode.WRONG_PASSWORD.code) {
      throw ApiException(ErrorCode.WRONG_PASSWORD.message);
    } else {
      throw ApiException('Failed to login');
    }
  }

  static Future<StaffResponse> getInfo() async{
    String? token = await getToken();
    if (token == null || token.isEmpty) {
      throw AuthException('Token is invalid');
    }

    var url = URLs().PERSONAL;

    var response = await http.get(
      url,
      headers: {"Authorization": "Bearer $token"},
    );

    var jsonResponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      StaffResponse staffResponse = StaffResponse.fromJson(jsonResponse);
      return staffResponse;
    } else if (jsonResponse['code'] == ErrorCode.USER_NOTFOUND.code) {
      throw ApiException(ErrorCode.USER_NOTFOUND.message);
    } else {
      throw ApiException('Failed to load staff info');
    }
  }

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return token;
  }

  static Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }
}