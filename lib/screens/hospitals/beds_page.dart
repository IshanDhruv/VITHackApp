import 'package:flutter/material.dart';
import 'package:json_table/json_table.dart';
import 'package:parkinsons_detection_app/models/beds.dart';
import 'package:parkinsons_detection_app/services/api_calls.dart';

class BedsPage extends StatefulWidget {
  @override
  _BedsPageState createState() => _BedsPageState();
}

class _BedsPageState extends State<BedsPage> {
  APICalls apiCalls = APICalls();
  Beds beds;
  bool _isLoading = true;
  List regionalJson = [];
  List summary = [];

  @override
  void initState() {
    getBeds();
    super.initState();
  }

  getBeds() async {
    setState(() {
      _isLoading = true;
    });
    beds = await apiCalls.getBeds();
    regionalJson = beds.regional;
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(),
                  Row(
                    children: [
                      Text(beds.summary['ruralHospitals'].toString()),
                      Text(beds.summary['ruralBeds'].toString()),
                      Text(beds.summary['urbanHospitals'].toString()),
                      Text(beds.summary['urbanBeds'].toString()),
                      Text(beds.summary['totalHospitals'].toString()),
                      Text(beds.summary['totalBeds'].toString()),
                    ],
                  ),
                  JsonTable(
                    regionalJson,
                    showColumnToggle: true,
                  ),
                ],
              ),
            ),
          );
  }
}
