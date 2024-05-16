import 'dart:async';
import '../api/StaffController.dart';
import '../entity/response/StaffResponse.dart';

class StaffService{
  final _controller = StreamController<StaffResponse>();

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