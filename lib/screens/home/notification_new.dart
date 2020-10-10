import 'package:flutter/material.dart';
import 'package:json_table/json_table.dart';
import 'package:parkinsons_detection_app/models/notification.dart';
import 'package:parkinsons_detection_app/services/api_calls.dart';

class NotificationNew extends StatefulWidget {
  @override
  _NotificationNewState createState() => _NotificationNewState();
}

class _NotificationNewState extends State<NotificationNew> {
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
            child: Container(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(),
                  JsonTable(notification.notifications),
                ],
              ),
            ),
          );
  }
}
