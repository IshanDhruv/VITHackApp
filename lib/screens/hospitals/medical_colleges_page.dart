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
  bool _isLoading = true;
  MedicalColleges medicalColleges;
  List colleges;
  List collegesJson;
  List states = ['Choose a state'];
  String state = 'Choose a state';

  @override
  void initState() {
    getMedicalColleges();
    super.initState();
  }

  getMedicalColleges() async {
    setState(() {
      _isLoading = true;
    });
    medicalColleges = await apiCalls.getMedicalColleges();
    colleges = medicalColleges.medicalColleges;
    getStates();
    setState(() {
      _isLoading = false;
    });
  }

  getStates() {
    colleges.forEach((element) {
      if (!states.contains(element['state'])) states.add(element['state']);
    });
    print(states);
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading == true
        ? Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(),
                  DropdownButton(
                    value: state,
                    onChanged: (val) {
                      setState(() {
                        state = val;
                        collegesJson = colleges.where((element) => element['state'] == state);
                      });
                    },
                    items: states.map((sstate) {
                      return DropdownMenuItem(
                        child: new Text(sstate),
                        value: sstate,
                      );
                    }).toList(),
                  ),
                  JsonTable(colleges)
//                  ListView.builder(
//                    shrinkWrap: true,
//                    physics: PageScrollPhysics(),
//                    itemCount: medicalColleges.medicalColleges.length,
//                    itemBuilder: (context, index) {
//                      if (colleges[index]['state'] == state)
//                        return stateRow(state);
//                      return Container();
//                    },
//                  )
                ],
              ),
            ),
          );
  }
}
