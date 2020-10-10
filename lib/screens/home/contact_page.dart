import 'package:flutter/cupertino.dart';
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
    var _width = MediaQuery.of(context).size.width;

    return _isLoading == true
        ? Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        color: Colors.white,
                        width: _width,
                        child: JsonTable(contact.regional,
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
                                style: TextStyle(color: Colors.blue[500]),
                              ));
                        })),
                  )
                ],
              ),
            ),
          );
  }
}
