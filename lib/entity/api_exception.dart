
// This file contains the custom exceptions that are thrown by the API - Ho Thanh Duy 21110759
class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() {
    return message;
  }
}

// This exception is thrown when the user is not authenticated - Ho Thanh Duy 21110759
class AuthException implements Exception {
  final String message;
  AuthException(this.message);

  @override
  String toString() {
    return message;
  }
}