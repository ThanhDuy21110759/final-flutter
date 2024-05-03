
class URLs{
  final Uri LOGIN = Uri.parse("http://192.168.1.9:8080/auth/login");
  final Uri FORGOT_PASSWORD = Uri.parse("http://192.168.1.9:8080");

  //order 1 item {from Homepage}
  final Uri HOME_PAGE = Uri.parse("http://192.168.1.9:8080/product");
  final Uri ORDER_ITEM = Uri.parse("http://192.168.1.9:8080/order");

  //order multiple items {from Cart}
  final Uri CART = Uri.parse("http://192.168.1.9:8080/order");

  //confirm order {from Cart}
  final Uri PLACE_ORDER = Uri.parse("http://192.168.1.9:8080/order");
  final Uri DELETE_ORDER = Uri.parse("http://192.168.1.9:8080/order/");
  final Uri UPDATE_ORDER = Uri.parse("http://192.168.1.9:8080");

  //personal {from Personal Information}
  final Uri PERSONAL = Uri.parse("http://192.168.1.9:8080/manager/myInfo");
  final Uri UPDATE_PERSONAL = Uri.parse("http://192.168.1.9:8080/manager/staffs");
  final Uri DELETE_PERSONAL = Uri.parse("http://192.168.1.9:8080/manager/staffs");
}