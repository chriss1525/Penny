import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';

class PennyProvider extends ChangeNotifier {
  bool _hasPermission = false;
  bool get hasPermission => _hasPermission;

  void setPermission(bool value) {
    _hasPermission = value;
    notifyListeners();
  }

  List<SmsMessage> _messages = [];
  List<SmsMessage> get messages => _messages;

  void setMessages(List<SmsMessage> value) {
    _messages = value;
    notifyListeners();
  }

  void addMessage(SmsMessage value) {
    _messages.add(value);
    notifyListeners();
  }
}
