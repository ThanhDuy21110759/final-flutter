// Fake service to get staff information - Ho Thanh Duy 21110759
import 'dart:async';
import '../api/StaffController.dart';
import '../entity/response/StaffResponse.dart';

class StaffService{
  final _controller = StreamController<StaffResponse>();

  // Get staff information every 1 second - Ho Thanh Duy 21110759
  Stream<StaffResponse> getStaffInfo() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      StaffAPI.getInfo().then((staffResponse) {
        _controller.sink.add(staffResponse);
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