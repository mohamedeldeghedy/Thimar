class BalanceModel {

  late final String status;
  late final String message;
  late final String data;

  BalanceModel.fromJson(Map<String, dynamic> json){
    status = json['status']??'';
    message = json['message']??'';
    data = json['data']??'';
  }

}