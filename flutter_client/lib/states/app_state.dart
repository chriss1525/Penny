import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';

class MyAppState extends ChangeNotifier {
  bool _hasPermission = false;

  bool get hasPermission => _hasPermission;

  void setPermission(bool value) {
    _hasPermission = value;
    notifyListeners();
  }

  // store messages retrieved from sms service
  List<SmsMessage> _messages = [];

  List<SmsMessage> get messages => _messages;

  void setMessages(List<SmsMessage> value) {
    _messages = value.where((e) => e.address! == "MPESA").toList();
    notifyListeners();
  }
}
