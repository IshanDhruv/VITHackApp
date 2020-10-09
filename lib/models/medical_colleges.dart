class MedicalColleges{
  bool message;
  List medicalColleges;
  List sources;

  MedicalColleges({this.message,this.medicalColleges,this.sources});

  MedicalColleges.fromJson(Map<String,dynamic> json){
    message = json['message'];
    medicalColleges = json['data']['medicalColleges'];
    sources = json['data']['sources'];
  }
}