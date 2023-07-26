import 'package:flutter/cupertino.dart';

class OTPNotifier extends ChangeNotifier {
  String _otp = '';

  String get otp => _otp;
  void add(item) {
    _otp = item;
    notifyListeners();
  }
}
