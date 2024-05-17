import 'package:coffee_ui/entity/api_exception.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:coffee_ui/entity/response/CustomerResponse.dart';

import '../constraint/api_urls.dart';
import 'AuthController.dart';

class CustomerAPI {
  static Future<CustomerResponse?> getCustomers(int id) async {
    String? token = await AuthAPI.getToken();
    var url = Uri.parse("${URLs().CUSTOMERS}/$id");

    var response = await http.get(
      url,
      headers: {"Authorization": "Bearer $token"},
    );

    var jsonResponse = jsonDecode(response.body);

    if (response.statusCode == 200) {

      CustomerResponse customerResponse = CustomerResponse.fromJson(jsonResponse);
      return customerResponse;
    } else if (response.statusCode == 404) {
      throw ApiException("Customer not found");
    } else {
      throw Exception('Failed to load customers');
    }
  }
}