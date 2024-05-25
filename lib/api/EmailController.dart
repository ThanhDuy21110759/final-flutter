import 'package:http/http.dart' as http;
import 'dart:convert';
import '../constraint/api_urls.dart';

class EmailAPI{
  static Future<bool> passwordRecovery(String toAddress) async {
    // Send email
    var url = URLs().RECOVERY;
    var body = jsonEncode({
      "email": toAddress}
    );
    var response = await http.post(url, body: body, headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}