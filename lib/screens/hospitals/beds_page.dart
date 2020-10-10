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
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: JsonTable(regionalJson, showColumnToggle: true,
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
