import 'package:flutter/cupertino.dart';

class CustomUser with ChangeNotifier {
  bool _isOTPVerified;

  verify(){
    this._isOTPVerified = true;
  }
}