class StaffResponse {
  int? code;
  Result? result;

  StaffResponse({this.code, this.result});

  StaffResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    result =
    json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  int? id;
  String? firstName;
  String? lastName;
  String? gender;
  String? role;
  String? address;
  String? phoneNumber;
  String? email;
  String? password;
  String? username;

  Result(
      {this.id,
        this.firstName,
        this.lastName,
        this.gender,
        this.role,
        this.address,
        this.phoneNumber,
        this.email,
        this.password,
        this.username});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    gender = json['gender'];
    role = json['role'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    password = json['password'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['gender'] = this.gender;
    data['role'] = this.role;
    data['address'] = this.address;
    data['phoneNumber'] = this.phoneNumber;
    data['email'] = this.email;
    data['password'] = this.password;
    data['username'] = this.username;
    return data;
  }
}