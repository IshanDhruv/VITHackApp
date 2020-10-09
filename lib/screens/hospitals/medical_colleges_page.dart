import 'package:flutter/material.dart';
import 'package:parkinsons_detection_app/models/medical_colleges.dart';
import 'package:parkinsons_detection_app/services/api_calls.dart';

class MedicalCollegesPage extends StatefulWidget {
  @override
  _MedicalCollegesPageState createState() => _MedicalCollegesPageState();
}

class _MedicalCollegesPageState extends State<MedicalCollegesPage> {
  APICalls apiCalls = APICalls();
  bool _isLoading = true;
  MedicalColleges colleges;

  @override
  void initState() {
    getMedicalColleges();
    super.initState();
  }

  getMedicalColleges() async {
    setState(() {
      _isLoading = true;
    });
    colleges = await apiCalls.getMedicalColleges();
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
                ListView.builder(
                  shrinkWrap: true,
                  physics: PageScrollPhysics(),
                  itemCount: colleges.medicalColleges.length,
                  itemBuilder: (context, index) {
                    return Text(colleges.medicalColleges[index]["state"]);
                  },
                )
              ],
            ),
          );
  }
}
