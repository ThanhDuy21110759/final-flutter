class URLs{
  final Uri LOGIN = Uri.parse("http://192.168.1.16:8080/auth/login");

  //order 1 item {from Homepage}
  final Uri HOME_PAGE = Uri.parse("http://192.168.1.16:8080/product");
  final Uri ORDER_ITEM = Uri.parse("http://192.168.1.16:8080/order");

  //order multiple items {from Cart }
  final Uri CART = Uri.parse("http://192.168.1.16:8080/order");
  final Uri TOTAL_CART = Uri.parse("http://192.168.1.16:8080/order/cost");

  //confirm order {from Cart}
  final Uri PLACE_ORDER = Uri.parse("http://192.168.1.16:8080/order");
  final Uri DELETE_ORDER = Uri.parse("http://192.168.1.16:8080/order/");
  final Uri UPDATE_ORDER = Uri.parse("http://192.168.1.16:8080");

  //personal {from Personal Information}
  final Uri PERSONAL = Uri.parse("http://192.168.1.16:8080/manager/myInfo");
  final Uri UPDATE_PERSONAL = Uri.parse("http://192.168.1.16:8080/manager/staffs");
  final Uri DELETE_PERSONAL = Uri.parse("http://192.168.1.16:8080/manager/staffs");

  //receipt
  final Uri RECEIPTS = Uri.parse("http://192.168.1.16:8080/receipt");

  //customer
  final Uri CUSTOMERS = Uri.parse("http://192.168.1.16:8080/customer");

  //product
  final Uri PRODUCTS = Uri.parse("http://192.168.1.16:8080/product");

  //condiment
  final Uri CONDIMENTS = Uri.parse("http://192.168.1.16:8080/condiment");

  //Recovery
  final Uri RECOVERY = Uri.parse("http://192.168.1.16:8080/auth/recovery");
}