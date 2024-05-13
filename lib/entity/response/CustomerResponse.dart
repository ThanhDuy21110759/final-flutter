class CustomerResponse {
  int? code;
  String? message;
  Customer? result;

  CustomerResponse({this.code, this.message, this.result});

  CustomerResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    result =
    json['result'] != null ? new Customer.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Customer {
  int? id;
  String? firstName;
  String? lastName;
  String? dateOfBirth;
  double? totalSpend;
  String? gender;
  String? phoneNumber;

  Customer(
      {this.id,
        this.firstName,
        this.lastName,
        this.dateOfBirth,
        this.totalSpend,
        this.gender,
        this.phoneNumber});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    dateOfBirth = json['dateOfBirth'];
    totalSpend = json['totalSpend'];
    gender = json['gender'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['dateOfBirth'] = this.dateOfBirth;
    data['totalSpend'] = this.totalSpend;
    data['gender'] = this.gender;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}