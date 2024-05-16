import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:coffee_ui/entity/response/ReceiptResponse.dart';
import '../constraint/api_urls.dart';
import '../entity/api_exception.dart';
import 'AuthController.dart';

class ReceiptAPI {
  static Future<ReceiptResponse> getAllReceipts() async {
    String? token = await AuthAPI.getToken();
    var url = URLs().RECEIPTS;

    var response = await http.get(
      url,
      headers: {"Authorization": "Bearer $token"},
    );

    var jsonResponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      ReceiptResponse receiptResponse = ReceiptResponse.fromJson(jsonResponse);
      return receiptResponse;
    } else {
      throw ApiException('Failed to load receipts');
    }
  }
  static Future<void> updateReceiptStatus(int index) async{
    String? token = await AuthAPI.getToken();
    var url = Uri.parse("${URLs().RECEIPTS}/$index/status");

    var response = await http.put(
      url,
      headers: {"Authorization": "Bearer $token"},
    );

    if (response.statusCode != 200) {
      throw ApiException('Failed to update receipt status');
    } else {
      throw ApiException('Update receipt status successfully');
    }
  }
}