class NotificationModel {

  late final NotificationData data;
  late final String status;
  late final String message;

  NotificationModel.fromJson(Map<String, dynamic> json){
    data = NotificationData.fromJson(json['data']??{});
    status = json['status']??'';
    message = json['message']??'';
  }

}

class NotificationData {

  late final int unreadnotificationsCount;
  // late final List<dynamic> notifications;

  NotificationData.fromJson(Map<String, dynamic> json){
    unreadnotificationsCount = json['unreadnotifications_count']??0;
    // notifications =(json['Notifications'] !=null ?  List.castFrom<dynamic, dynamic>(json['notifications']):null)!;
  }

}


