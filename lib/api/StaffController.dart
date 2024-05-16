import 'dart:convert';

import 'package:coffee_ui/entity/response/StaffResponse.dart';
import 'package:http/http.dart' as http;

import '../constraint/api_urls.dart';
import '../entity/api_exception.dart';
import 'AuthController.dart';

class StaffAPI{
  static Future<StaffResponse> getInfo() async {
    String? token = await AuthAPI.getToken();
    var url = URLs().PERSONAL;

    var response = await http.get(
      url,
      headers: {"Authorization": "Bearer $token"},
    );
    var jsonResponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      StaffResponse staffResponse = StaffResponse.fromJson(jsonResponse);
      return staffResponse;
    } else if (jsonResponse['code'] == 1005) {
        throw ApiException(jsonResponse['message']);
    } else {
      throw ApiException('Failed to load staff info');
    }
  }

  static Future<void> updateInfo(String fstName, String lstName, String address, String phone, String email) async {

    Map <String, dynamic> myJson = {
        "firstName": fstName,
        "lastName": lstName,
        "address": address,
        "phoneNumber": phone,
        "email": email
    };

    String? token = await AuthAPI.getToken();
    var url = URLs().UPDATE_PERSONAL;
    var body = jsonEncode(myJson);

    var response = await http.put(
      url,
      body: body,
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json"
      },
    );
    var jsonResponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      throw ApiException("Update successfully!!");
    } else if (jsonResponse['code'] == 1002){
      throw ApiException(jsonResponse['message']);
    } else {
      throw ApiException('Failed to update staff info');
    }
  }
}