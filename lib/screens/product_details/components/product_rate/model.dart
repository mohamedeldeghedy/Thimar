class ProductRate {

  late final List<Rate> data;
  late final String status;
  late final String message;

  ProductRate.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Rate.fromJson(e)).toList();
    status = json['status'];
    message = json['message'];
  }

}

class RateData{
  late final List<Rate> list;
  late final String status;
  late final String message;

  RateData.fromJson(Map<String, dynamic> json){
    list = List.from(json['data']).map((e)=>Rate.fromJson(e)).toList();
    status = json['status'];
    message = json['message'];
  }
}
class Rate {
  late final num value;
  late final String comment;
  late final String clientName;
  late final String clientImage;

  Rate.fromJson(Map<String, dynamic> json){
    value = json['value']??0;
    comment = json['comment'];
    clientName = json['client_name'];
    clientImage = json['client_image'];
  }


}






























