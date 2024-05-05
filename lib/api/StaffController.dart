import 'dart:convert';

import 'package:coffee_ui/entity/response/StaffResponse.dart';
import 'package:http/http.dart' as http;

import '../constraint/api_urls.dart';
import '../entity/api_exception.dart';
import 'AuthController.dart';

class StaffAPI{
  static Future<StaffResponse> getInfo() async {
    // String? token = await AuthAPI.getToken();
    String token = 'eyJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJjYWZlLmNvbSIsInN1YiI6Im1hbmFnZXIxMjMiLCJleHAiOjE3MTQ5MzU0MzcsImlhdCI6MTcxNDkzMTgzNywic2NvcGUiOiJNQU5BR0VSIn0.6t7zCC1fZzn9LBXJAUzGDho6OtMUhJObTTCmg25xxQBx16HcNutt-HjHjOrVzYEfEy1NGLNU5XAteLynmvzcyg';
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