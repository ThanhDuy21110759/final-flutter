// Simple class to handle order related API calls and return the response - Ho Thanh Duy 21110759
import 'package:http/http.dart' as http;
import 'package:coffee_ui/api/AuthController.dart';
import 'package:coffee_ui/entity/response/CartResponse.dart';
import 'package:coffee_ui/entity/request/OrderCreateRequest.dart';
import 'dart:convert';
import '../constraint/api_urls.dart';
import '../constraint/error_code.dart';
import '../entity/api_exception.dart';

class OrderAPI{
  // Get cart from server - Ho Thanh Duy 21110759
  // Return CartResponse object if success
  // Throw AuthException if token is invalid
  static Future<CartResponse> getCart() async {
    String? token = await AuthAPI.getToken();
    var url = URLs().CART;

    var response = await http.get(
      url,
      headers: {"Authorization": "Bearer $token"},
    );

    var jsonResponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      CartResponse cartResponse = CartResponse.fromJson(jsonResponse);
      return cartResponse;
    } else if (jsonResponse['code'] == 202) {
      throw AuthException(jsonResponse['message']);
    } else {
      throw ApiException('Failed to load cart');
    }
  }

  // Place order to server - Ho Thanh Duy 21110759
  // Return CartResponse object if success
  // Throw AuthException if token is invalid
  static Future<CartResponse> placeOrder(OrderCreateRequest order) async {
    String? token = await AuthAPI.getToken();
    var url = URLs().CART;
    var body = jsonEncode(order.toJson());

    var response = await http.post(
      url,
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json"
      },
      body: body,
    );

    var jsonResponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      CartResponse cartResponse = CartResponse.fromJson(jsonResponse);
      print("Place order success");
      return cartResponse;
    } else if (jsonResponse['code'] == 1009) {
      throw AuthException(jsonResponse['message']);
    } else if (jsonResponse['code'] == 1008) {
      throw AuthException(jsonResponse['message']);
    } else {
      throw ApiException('Failed to place order');
    }
  }

  // Delete order from server - Ho Thanh Duy 21110759
  // Throw AuthException if token is invalid
  // Throw ApiException if failed to delete order
  // Print message if success
  static Future<void> deleteOrder(int id) async {
    String? token = await AuthAPI.getToken();
    var url = Uri.parse(URLs().DELETE_ORDER.toString() + id.toString());

    var response = await http.delete(
      url,
      headers: {"Authorization": "Bearer $token"},
    );

    var jsonResponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print(ErrorCode.ORDER_DELETED_SUCCESSFULLY.message);
    } else if (jsonResponse['code'] == 203) {
      throw AuthException(jsonResponse['message']);
    } else {
      throw ApiException('Failed to delete order');
    }
  }

  // Get total cost of cart - Ho Thanh Duy 21110759
  // Return total cost if success
  // Throw ApiException if failed to get cost
  // Throw AuthException if token is invalid
  static Future<double> getCost() async{
    String? token = await AuthAPI.getToken();
    var url = URLs().TOTAL_CART;

    var response = await http.get(
      url,
      headers: {"Authorization": "Bearer $token"},
    );
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200){
      return jsonResponse['result'];
    } else {
      throw ApiException('Failed to get cart\'s cost');
    }
  }
}