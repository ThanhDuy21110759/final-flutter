import '../api/StaffController.dart';
import '../entity/response/StaffResponse.dart';

class StaffService{
  StaffResponse? staffResponse;

  StaffService._privateConstructor();

  static final StaffService _instance = StaffService._privateConstructor();

  static StaffService get instance {
    return _instance;
  }

  Future<void> getStaffInfo() async {
    staffResponse = await StaffAPI.getInfo();
  }
}