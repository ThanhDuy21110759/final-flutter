// Simulates the service layer of the application. It is responsible for fetching data from the API and returning it to the UI layer.
import 'dart:async';
import '../api/CustomerController.dart';
import '../entity/response/CustomerResponse.dart';

class CustomerService{
  final _controller = StreamController<CustomerResponse>();

  // Fetches the customer data by ID from the API and returns it to the UI layer - Ho Thanh Duy 21110759
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