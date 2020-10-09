import 'package:flutter/material.dart';
import 'package:parkinsons_detection_app/models/notification.dart';
import 'package:parkinsons_detection_app/services/api_calls.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  APICalls apiCalls = APICalls();
  NotificationClass notification;
  bool _isLoading = true;

  @override
  void initState() {
    getNotifications();
    super.initState();
  }

  getNotifications() async {
    setState(() {
      _isLoading = true;
    });
    notification = await apiCalls.getNotifications();
    print(notification.notifications[0]['title']);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading == true
        ? Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: notification.notifications.length,
                  itemBuilder: (context, index) {
                    return Text(notification.notifications[index]["title"]);
                  },
                )
              ],
            ),
          );
  }
}
