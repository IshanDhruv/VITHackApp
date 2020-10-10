import 'package:flutter/material.dart';
import 'package:json_table/json_table.dart';
import 'package:parkinsons_detection_app/models/medical_colleges.dart';
import 'package:parkinsons_detection_app/services/api_calls.dart';

class MedicalCollegesPage extends StatefulWidget {
  @override
  _MedicalCollegesPageState createState() => _MedicalCollegesPageState();
}

class _MedicalCollegesPageState extends State<MedicalCollegesPage> {
  APICalls apiCalls = APICalls();
  MedicalColleges medicalColleges;
  List colleges = [];
  List collegesJson = [];
  List states = ['Choose a state'];
  String state = 'Choose a state';

  @override
  void initState() {
    //getMedicalColleges();
//    print(colleges.length);
    super.initState();
  }

  getMedicalColleges() async {
    medicalColleges = await apiCalls.getMedicalColleges();
    colleges = medicalColleges.medicalColleges;
    collegesJson = colleges;
    getStates();
    return true;
  }

  getStates() {
    colleges.forEach((element) {
      if (!states.contains(element['state'])) states.add(element['state']);
    });
    print(states);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getMedicalColleges(),
      builder: (context, snapshot) {
        if (snapshot.data == null)
          return Center(child: CircularProgressIndicator());
        else
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(),
                  DropdownButton(
                    value: state,
                    onChanged: (val) {
                      changeState(val);
                    },
                    items: states.map((sstate) {
                      return DropdownMenuItem(
                        child: new Text(sstate),
                        value: sstate,
                      );
                    }).toList(),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      child: JsonTable(collegesJson, paginationRowCount: 50,
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
                              maxLines: 1,
                              style: TextStyle(
                                  color: Colors.blue[500], fontSize: 16),
                            ));
                      }),
                    ),
                  )
                ],
              ),
            ),
          );
      },
    );
//    return _isLoading == true
//        ? Center(child: CircularProgressIndicator())
//        :
  }

  changeState(String val) {
    setState(() {
      state = val;
      collegesJson.clear();
      print(colleges.length);
      for (int i = 0; i < colleges.length; i++) {
        if (colleges[i]['state'] == state) {
          collegesJson.add(colleges[i]);
        }
      }
      print(collegesJson);
    });
  }
}
