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

      //print info
      print('Staff ID: ${staffResponse.result?.id}');
      return staffResponse;
    } else if (jsonResponse['code'] == 1005) {
        throw ApiException(jsonResponse['message']);
    } else {
      throw ApiException('Failed to load staff info');
    }
  }
  static Future<StaffResponse> updateInfo() async {
    String? token = await AuthAPI.getToken();
    var url = URLs().UPDATE_PERSONAL;

    var response = await http.post(
      url,
      headers: {"Authorization": "Bearer $token"},
    );
    var jsonResponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      //processing the response
      StaffResponse staffResponse = StaffResponse.fromJson(jsonResponse);
      return staffResponse;
    } else if (jsonResponse['code'] == 1002){
      throw ApiException(jsonResponse['message']);
    } else {
      throw ApiException('Failed to load staff info');
    }
  }
}