import 'package:http/http.dart' as http;
import 'dart:convert';
import '../constraint/api_urls.dart';
import '../entity/response/CondimentResponse.dart';
import 'AuthController.dart';

class CondimentAPI{
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