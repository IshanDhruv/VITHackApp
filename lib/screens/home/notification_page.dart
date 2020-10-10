import 'package:flutter/material.dart';
import 'package:json_table/json_table.dart';
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
            child: Container(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      child: JsonTable(notification.notifications,
                          tableHeaderBuilder: (String header) {
                        return Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.lightBlue[300].withOpacity(1),
                          ),
                          child: Text(header.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                        );
                      }, tableCellBuilder: (value) {
                        return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                                border: Border.symmetric(
                                    horizontal: BorderSide(width: 0.1))),
                            child: Text(
                              value,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.blue[500], fontSize: 16),
                            ));
                      }),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
