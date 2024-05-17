import 'dart:async';
import '../api/CustomerController.dart';
import '../entity/response/CustomerResponse.dart';

class CustomerService{
  final _controller = StreamController<CustomerResponse>();

  Stream<CustomerResponse> getCustomerById(int id) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      CustomerAPI.getCustomers(id).then((customerResponse) {
        _controller.sink.add(customerResponse!);
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