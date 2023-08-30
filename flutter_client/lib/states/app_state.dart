import 'package:flutter/material.dart';
import 'package:penny/models/transaction.dart';
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

  /*
    e.body!.contains(
      RegExp(r'^.* sent to .+ \d{10} on \d{1,2}/\d{1,2}/\d{2}'),
    ),
  */

  // transactions from messages
  List<Map<String, dynamic>> _transactions = [];

  List<Map<String, dynamic>> get transactions => _transactions;

  void setTransactions() {
    _transactions = messages.map((e) {
      return SendMoneyTransaction.fromMessage(e.body!).toMap();
    }).toList();
    notifyListeners();
  }
}
