import 'package:coffee_ui/entity/response/CustomerResponse.dart';

import '../api/CustomerController.dart';

class CustomerService {
  CustomerResponse? customerResponse;

  CustomerService._privateConstructor();

  static final CustomerService _instance = CustomerService._privateConstructor();

  static CustomerService get instance {
    return _instance;
  }

  Future<void> getCustomerById(int id) async {
    customerResponse = await CustomerAPI.getCustomers(id);
  }
}