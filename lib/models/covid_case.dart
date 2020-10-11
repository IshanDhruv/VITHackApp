import 'package:intl/intl.dart';

class CovidCase {
  int patientID;
  DateTime reportedOn;
//  String reportedOn;
  String ageEstimate;
  String gender;
  String state = 'Other';
  String status;

  CovidCase(
      {this.patientID,
      this.reportedOn,
      this.ageEstimate,
      this.gender,
      this.state,
      this.status});

  CovidCase.fromJson(Map<String, dynamic> json) {
    patientID = json['patientID'];
    reportedOn = DateTime.parse(json['reportedOn']);
//    reportedOn = json['reportedOn'];
    ageEstimate = json['ageEstimate'];
    gender = json['gender'];
    state = json['state'] ?? 'Other';
    status = json['status'];
  }
}
