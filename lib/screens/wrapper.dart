import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parkinsons_detection_app/screens/authenticate/phone_screen.dart';
import 'package:parkinsons_detection_app/screens/info/info_page.dart';
import 'package:parkinsons_detection_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'authenticate/authenticate.dart';
import 'home/home_page.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool _detailsSubmitted = true;
  AuthService _auth = AuthService();
  SharedPreferences _prefs;

  @override
  void initState() {
    checkIfSubmitted();
    super.initState();
  }

  Future checkIfSubmitted() async {
    _prefs = await SharedPreferences.getInstance();
    _detailsSubmitted = _prefs.getBool('detailsSubmitted');
    print(_detailsSubmitted);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null)
      return Authenticate();
    else
      return _detailsSubmitted != true ? InfoPage() : HomePage();
  }
}
