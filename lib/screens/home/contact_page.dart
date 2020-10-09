import 'package:flutter/material.dart';
import 'package:json_table/json_table.dart';
import 'package:parkinsons_detection_app/models/contact.dart';
import 'package:parkinsons_detection_app/services/api_calls.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  APICalls apiCalls = APICalls();
  Contact contact;
  Primary primary;
  bool _isLoading = true;

  @override
  void initState() {
    getContactInfo();
    super.initState();
  }

  getContactInfo() async {
    setState(() {
      _isLoading = true;
    });
    contact = await apiCalls.getContactInformation();
    primary = contact.primary;
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
              padding: EdgeInsets.all(20),
              color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(),
                  Text("Contacts & helpline"),
                  Text("Primary"),
                  Text("number:"),
                  Text(primary.number),
                  Text("number-tollfree"),
                  Text(primary.numberTollFree),
                  Text("other handles:"),
                  IconButton(
                      icon: Icon(Icons.email),
                      onPressed: () async {
                        await launch(primary.email);
                      }),
                  Text(primary.email),
                  Text(primary.twitter),
                  Text(primary.facebook),
                  Text(primary.media),
                  Container(
                      color: Colors.white,
                      child: JsonTable(contact.regional,
                          tableCellBuilder: (value) {
                        return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 4.0, vertical: 2.0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5,
                                    color: Colors.grey.withOpacity(0.5))),
                            child: Text(
                              value,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.blue[500]),
                            ));
                      }))
                ],
              ),
            ),
          );
  }
}
