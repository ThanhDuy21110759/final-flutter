import 'package:coffee_ui/entity/response/ProductResponse.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constraint/api_urls.dart';
import 'AuthController.dart';

class ProductAPI{

  static Future<ProductResponse> getAlls() async {

    String? token = await AuthAPI.getToken();
    var url = URLs().PRODUCTS;

    var response = await http.get(
      url,
      headers: {"Authorization": "Bearer $token"},
    );
    var jsonResponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      ProductResponse productResponse = ProductResponse.fromJson(jsonResponse);
      return productResponse;
    } else {
      throw Exception('Failed to load products');
    }
  }
}