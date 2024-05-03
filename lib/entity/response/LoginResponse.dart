class LoginResponse{
  int? code;
  Result? result;

  LoginResponse({this.code, this.result});

  LoginResponse.fromJson(Map<String, dynamic> json) {
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
  bool? authenticated;
  String? token;

  Result({this.authenticated, this.token});

  Result.fromJson(Map<String, dynamic> json) {
    authenticated = json['authenticated'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['authenticated'] = authenticated;
    data['token'] = token;
    return data;
  }
}