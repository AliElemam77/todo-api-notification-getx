class LoginResponse {
  String? token;
  Data? data;

  LoginResponse({this.token, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? sId;
  String? name;
  String? email;
  String? password;
  String? role;

  Data({
    this.sId,
    this.name,
    this.email,
    this.password,
    this.role,
  });

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
  }
}
