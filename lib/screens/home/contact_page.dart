import 'package:flutter/material.dart';
import 'package:parkinsons_detection_app/models/contact.dart';
import 'package:parkinsons_detection_app/services/api_calls.dart';

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(),
                Text("Call us at"),
                Text(primary.number),
                Text("Call us at (toll free)"),
                Text(primary.numberTollFree),
                Text(primary.email),
                Text(primary.twitter),
                Text(primary.facebook),
                Text(primary.media),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: contact.regional.length,
                  itemBuilder: (context, index) {
                    return Text(contact.regional[index]["loc"]);
                  },
                )
              ],
            ),
          );
  }
}
