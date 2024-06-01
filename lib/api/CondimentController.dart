// Call API from Condiment API and return the list of condiments - Ho Thanh Duy 21110759
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../constraint/api_urls.dart';
import '../entity/response/CondimentResponse.dart';
import 'AuthController.dart';

class CondimentAPI{
  // Get condiments list from API and return list of condiments - Ho Thanh Duy 21110759
  // Return list of condiments
  // Throw error if failed to load condiments list
  static Future<List<Condiment>> getCondiments() async {
    String? token = await AuthAPI.getToken();
    var url = URLs().CONDIMENTS;

    var response = await http.get(
      url,
      headers: {"Authorization": "Bearer $token"},
    );
    var body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      List<Condiment> condiments = body.map<Condiment>((dynamic item) => Condiment.fromJson(item)).toList();
      return condiments;
    } else {
      throw "Failed to load condiments list";
    }
  }
}