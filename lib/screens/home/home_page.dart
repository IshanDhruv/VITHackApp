import 'package:flutter/material.dart';
import 'package:parkinsons_detection_app/screens/home/contact_new.dart';
import 'package:parkinsons_detection_app/screens/home/notification_new.dart';
//import 'file:///C:/Users/ishan/AndroidStudioProjects/parkinson_detection/lib/screens/home/contact_page.dart';
import 'package:parkinsons_detection_app/screens/home/notification_page.dart';
import 'package:parkinsons_detection_app/screens/hospitals/hospitals.dart';


import 'contact_page.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    _selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> _widgetOptions = <Widget>[
      HospitalsPage(),
      NotificationNew(),
      ContactNew()
    ];

    void _onTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.local_hospital), title: Text("Hospitals")),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), title: Text("Notifications")),
          BottomNavigationBarItem(icon: Icon(Icons.info), title: Text("Contact Us"))
        ],
        currentIndex: _selectedIndex,
        onTap: _onTapped,
      ),
    );
  }
}
