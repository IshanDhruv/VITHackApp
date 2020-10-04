import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parkinsons_detection_app/services/auth.dart';
import 'package:provider/provider.dart';

class PhonePage extends StatefulWidget {
  @override
  _PhonePageState createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  AuthService _auth = AuthService();



  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Container(
        child: RaisedButton(
      child: Text("Verify phone number"),
      onPressed: () {
        _auth.addPhoneNumber(user, '9880773961');
      },
    ));
  }
}
