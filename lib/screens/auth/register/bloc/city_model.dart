class CityModel {

  late final List<CityData> data;
  late final String status;
  late final String message;

  CityModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']??{}).map((e)=>CityData.fromJson(e)).toList();
    status = json['status']??"";
    message = json['message']??"";
  }

}

class CityData {

  late final String id;
    late String name;

  CityData.fromJson(Map<String, dynamic> json){
    id = json['id']??"";
    name = json['name']??"";
  }

}