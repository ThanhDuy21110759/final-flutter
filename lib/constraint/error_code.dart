class ErrorCode {
  final int code;
  final String message;
  final int statusCode;

  const ErrorCode._(this.code, this.message, this.statusCode);

  static const ErrorCode UNCATEGORIZED = ErrorCode._(9999, "Uncategorized exception", 500);
  static const ErrorCode KEY_INVALID = ErrorCode._(9998, "Key is invalid", 400);
  static const ErrorCode USER_EXISTED = ErrorCode._(1001, "User is existed", 400);
  static const ErrorCode USER_NOTFOUND = ErrorCode._(1002, "User not found", 404);
  static const ErrorCode USERNAME_INVALID = ErrorCode._(1003, "Username must be at least 8 characters and maximum 20 characters", 400);
  static const ErrorCode PASSWORD_INVALID = ErrorCode._(1004, "Password must be at least 8 characters and maximum 20 characters", 400);
  static const ErrorCode UNAUTHENTICATED = ErrorCode._(1005, "Unauthenticated", 401);
  static const ErrorCode UNAUTHORIZED = ErrorCode._(1006, "You are not allowed!", 403);
  static const ErrorCode WRONG_PASSWORD = ErrorCode._(1007, "The Username/Password is wrong!!", 400);
  static const ErrorCode PRODUCT_NOT_FOUND = ErrorCode._(1008, "Product not found", 404);
  static const ErrorCode CONDIMENTS_NOT_FOUND = ErrorCode._(1009, "Condiments not found", 404);
  static const ErrorCode SIZE_NOT_FOUND = ErrorCode._(1010, "Size not found", 404);
  static const ErrorCode ORDER_PLACED_SUCCESSFULLY = ErrorCode._(200, "Order placed successfully", 200);
  static const ErrorCode ORDER_DELETED_SUCCESSFULLY = ErrorCode._(200, "Order deleted successfully", 200);
  static const ErrorCode CART_IS_EMPTY = ErrorCode._(202, "Cart is empty", 400);
  static const ErrorCode INVALID_INDEX = ErrorCode._(203, "Order not found", 404);
  static const ErrorCode INVALID_TOKEN = ErrorCode._(204, "Invalid token", 400);
  static const ErrorCode USER_UPDATED = ErrorCode._(205, "User updated successfully", 200);
}