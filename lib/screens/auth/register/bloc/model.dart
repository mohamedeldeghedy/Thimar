class RegisterModel {
  late String status;
  late String message;
  late UserData? data;

  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data']!=null?UserData.fromJson(json['data']):null;
  }
}

class UserData {
  late int id;
  late String name;
  late String phone;
  late String token;
  late String city;

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    name = json['fullname']??'';
    phone = json['phone']??'';
    token = json['token']??'';
    city=json['city']??'';
  }
}
