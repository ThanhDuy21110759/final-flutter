// Used for fetching products from the API and returning them as a ProductResponse object - Ho Thanh Duy 21110759
import 'package:coffee_ui/entity/response/ProductResponse.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constraint/api_urls.dart';
import 'AuthController.dart';

class ProductAPI{

  // Fetch all products from the API - Ho Thanh Duy 21110759
  // Return a ProductResponse object
  // If the response status code is not 200, throw an exception
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