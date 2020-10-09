class Beds{
  bool message;
  Map summary;
  List sources;
  List regional;

  Beds({this.message,this.summary,this.sources,this.regional});

  Beds.fromJson(Map<String,dynamic> json){
    message = json['success'];
    summary = json['data']['summary'];
    sources = json['data']['sources'];
    regional = json['data']['regional'];
  }
}