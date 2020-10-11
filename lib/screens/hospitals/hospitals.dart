import 'package:flutter/material.dart';
import 'package:parkinsons_detection_app/screens/hospitals/beds_new.dart';
import 'package:parkinsons_detection_app/screens/hospitals/medical_colleges_new.dart';
import 'package:parkinsons_detection_app/screens/hospitals/medical_colleges_page.dart';

import 'beds_page.dart';

class HospitalsPage extends StatefulWidget {
  @override
  _HospitalsPageState createState() => _HospitalsPageState();
}

class _HospitalsPageState extends State<HospitalsPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final weight = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height*0.11),
          child: AppBar(
            backgroundColor: Colors.grey[100],
            elevation: 0,
            title: Text("Hospitals"),
            bottom: TabBar(
                isScrollable: true,
                indicatorColor: Colors.black,
                indicatorWeight: 2.5,
                tabs: [
                  Tab(
                      child: Text(
                    'Beds',
                    style: TextStyle(color: Colors.black),
                  )),
                  Tab(
                      child: Text(
                    'Medical Colleges',
                    style: TextStyle(color: Colors.black),
                  )),
                ]),
          ),
        ),
        body: TabBarView(
          children: [BedsNew(), MedicalCollegesNew()],
        ),
      ),
    );
  }
}
