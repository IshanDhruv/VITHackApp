class Contact {
  bool message;
  Primary primary;
  List regional;

  Contact({this.message, this.primary, this.regional});

  Contact.fromJson(Map<String, dynamic> json) {
    message = json['success'];
    primary = Primary.fromJson(json['data']['contacts']['primary']);
    regional = json['data']['contacts']['regional'];
  }
}

class Primary {
  String number;
  String numberTollFree;
  String email;
  String twitter;
  String facebook;
  String media;

  Primary(
      {this.number,
      this.numberTollFree,
      this.email,
      this.twitter,
      this.facebook,
      this.media});

  Primary.fromJson(Map json){
    number = json['number'];
    numberTollFree = json['number-tollfree'];
    email = json['email'];
    twitter = json['twitter'];
    facebook = json['facebook'];
    media = json['media'][0];
  }
}
