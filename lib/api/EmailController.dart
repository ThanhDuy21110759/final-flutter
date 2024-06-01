// This file contains the EmailAPI class which is responsible for sending emails to users - Ho Thanh Duy 21110759
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../constraint/api_urls.dart';

class EmailAPI{
  // Send email to user with password recovery link - Ho Thanh Duy 21110759
  // Returns true if email was sent successfully
  // Returns false if email was not sent successfully
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