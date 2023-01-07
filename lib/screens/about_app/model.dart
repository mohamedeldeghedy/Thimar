class AboutAppModel {

  late final AboutAppData data;
  late final String status;
  late final String message;

  AboutAppModel.fromJson(Map<String, dynamic> json){
    data = AboutAppData.fromJson(json['data']??{});
    status = json['status']??"";
    message = json['message']??"";
  }

}

class AboutAppData {

  late final String about;

  AboutAppData.fromJson(Map<String, dynamic> json){
    about = json['about']??"";
  }

}