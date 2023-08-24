import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier {
  bool _hasPermission = false;

  bool get hasPermission => _hasPermission;

  void setPermission(bool value) {
    _hasPermission = value;
    notifyListeners();
  }
}
