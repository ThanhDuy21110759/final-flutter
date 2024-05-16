import 'dart:async';
import 'package:coffee_ui/entity/response/CartResponse.dart';
import 'package:coffee_ui/entity/request/OrderCreateRequest.dart' as Order;
import 'package:coffee_ui/view/order_detail/order_page.dart';

import '../api/OrderController.dart';

class CartService {
  //list contains all the cart responses
  final _controller = StreamController<List<Result>>();
  final _costController = StreamController<double>();

  Stream<List<Result>> getCartItems() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      OrderAPI.getCart().then((cartResponse) {
        _controller.sink.add(cartResponse.result!);
      }).catchError((error) {
        _controller.sink.addError(error);
      });
    });

    return _controller.stream;
  }

  void dispose() {
    _controller.close();
  }

  int getIndexBySize(sizeType size){
    switch(size){
      case sizeType.small:
        return 1;
      case sizeType.medium:
        return 2;
      case sizeType.large:
        return 3;
    }
  }

  Future<void> addProductToCart(int productId,
      int itemCount,
      sizeType selectedSize,
      Map<String, int> selectedCondiments) async {

    //Mapper values to the OrderCreateRequest
    int size = getIndexBySize(selectedSize);
    Order.OrderCreateRequest orderCreateRequest = Order.OrderCreateRequest();
    orderCreateRequest.product = Order.Product(id: productId, size: size);
    orderCreateRequest.quantity = itemCount;
    orderCreateRequest.productCondimentDetails = Order.ProductCondimentDetails();
    orderCreateRequest.productCondimentDetails?.condiment = [];
    selectedCondiments.forEach((key, value) {
      Order.Condiment condiment = Order.Condiment();
      condiment.id = int.parse(key);
      condiment.quantity = value;
      orderCreateRequest.productCondimentDetails?.condiment?.add(condiment);
    });

    //Calling API to add order to cart
    try {
      await OrderAPI.placeOrder(orderCreateRequest);
    } catch (e) {
      print("Error: $e");
    }
  }

  Stream<double> getCostStream() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      OrderAPI.getCost().then((cost) {
        _costController.sink.add(cost);
      }).catchError((error) {
        _costController.sink.addError(error);
      });
    });

    return _costController.stream;
  }
}