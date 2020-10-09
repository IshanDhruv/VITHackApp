class NotificationClass{
  bool message;
  List notifications;

  NotificationClass({this.message,this.notifications});

  NotificationClass.fromJson(Map<String,dynamic> json){
    message = json['success'];
    notifications = json['data']['notifications'];
  }
}

class NotificationsChild{
  String title;
  String link;

  NotificationsChild({this.title,this.link});

  NotificationsChild.fromJson(Map<String, dynamic> json){
    title = json['title'];
    link = json['link'];
  }
}