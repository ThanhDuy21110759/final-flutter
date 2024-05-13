import 'dart:async';

import 'package:coffee_ui/entity/response/ProductResponse.dart';
import '../api/ProductController.dart';

class ProductService{
  final _controller = StreamController<List<Product>>();

  Stream<List<Product>> getProducts() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      ProductAPI.getAlls().then((productResponse) {
        _controller.sink.add(productResponse.result!);
      }).catchError((error) {
        _controller.sink.addError(error);
      });
    });

    return _controller.stream;
  }

  void dispose() {
    _controller.close();
  }
}