class ApiException implements Exception {
  final String message;
  ApiException(this.message);
}

class AuthException implements Exception {
  final String message;
  AuthException(this.message);
}