class UserResponse {
  int? code;
  User? result;

  UserResponse({this.code, this.result});

  UserResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    result =
    json['result'] != null ? User.fromJson(json['result']) : null;
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

class User {
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

  User(
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

  User.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['gender'] = gender;
    data['role'] = role;
    data['address'] = address;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['password'] = password;
    data['username'] = username;
    return data;
  }
}


