import 'package:flutter/material.dart';
import 'package:parkinsons_detection_app/screens/hospitals/medical_colleges_page.dart';

import 'beds_page.dart';

class HospitalsPage extends StatefulWidget {
  @override
  _HospitalsPageState createState() => _HospitalsPageState();
}

class _HospitalsPageState extends State<HospitalsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hospitals"),
          bottom: TabBar(tabs: [
            Tab(text: 'Beds'),
            Tab(text: 'Medical Colleges'),
          ]),
        ),
        body: TabBarView(
          children: [
            BedsPage(),
            MedicalCollegesPage()
          ],
        ),
      ),
    );
  }
}
