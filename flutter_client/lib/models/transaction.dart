import 'dart:convert';

//TODO: Buy Airtime Transactions
//TODO: Buy Bundles Transactions
//TODO: Recieve from Bulk Account (e.g Equity) Transactions

class RecievedMoneyTransaction extends BaseTransaction {
  final String sender;
  final String senderPhone;

  RecievedMoneyTransaction({
    required String id,
    required String transactionId,
    required String amount,
    required String type,
    required String date,
    required String time,
    required String cost,
    required String balance,
    required this.sender,
    required this.senderPhone,
  }) : super(
          id: id,
          transactionId: transactionId,
          amount: amount,
          type: type,
          date: date,
          time: time,
          cost: cost,
          balance: balance,
        );
}

class BuyGoodsTransaction extends BaseTransaction {
  final String business;

  BuyGoodsTransaction({
    required String id,
    required String transactionId,
    required String amount,
    required String type,
    required String date,
    required String time,
    required String cost,
    required String balance,
    required this.business,
  }) : super(
          id: id,
          transactionId: transactionId,
          amount: amount,
          type: type,
          date: date,
          time: time,
          cost: cost,
          balance: balance,
        );
}

class BuyBundlesTransaction extends PayBillTransaction {
  BuyBundlesTransaction({
    required String id,
    required String transactionId,
    required String amount,
    required String type,
    required String date,
    required String time,
    required String cost,
    required String balance,
    required String business,
    required String account,
  }) : super(
          id: id,
          transactionId: transactionId,
          amount: amount,
          type: type,
          date: date,
          time: time,
          cost: cost,
          balance: balance,
          business: business,
          account: account,
        );
}

class PayBillTransaction extends BaseTransaction {
  final String business;
  final String account;

  PayBillTransaction({
    required String id,
    required String transactionId,
    required String amount,
    required String type,
    required String date,
    required String time,
    required String cost,
    required String balance,
    required this.business,
    required this.account,
  }) : super(
          id: id,
          transactionId: transactionId,
          amount: amount,
          type: type,
          date: date,
          time: time,
          cost: cost,
          balance: balance,
        );
}

class PochiTransaction extends BaseTransaction {
  final String recipient;

  PochiTransaction({
    required String id,
    required String transactionId,
    required String amount,
    required String type,
    required String date,
    required String time,
    required String cost,
    required String balance,
    required this.recipient,
  }) : super(
          id: id,
          transactionId: transactionId,
          amount: amount,
          type: type,
          date: date,
          time: time,
          cost: cost,
          balance: balance,
        );
}

class SendMoneyTransaction extends BaseTransaction {
  final String recipient;
  final String recipientPhone;

  SendMoneyTransaction({
    required String id,
    required String transactionId,
    required String amount,
    required String type,
    required String date,
    required String time,
    required String cost,
    required String balance,
    required this.recipient,
    required this.recipientPhone,
  }) : super(
          id: id,
          transactionId: transactionId,
          amount: amount,
          type: type,
          date: date,
          time: time,
          cost: cost,
          balance: balance,
        );

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'transactionId': transactionId,
      'amount': amount,
      'type': type,
      'date': date,
      'time': time,
      'cost': cost,
      'balance': balance,
      'recipient': recipient,
      'recipientPhone': recipientPhone,
    };
  }

  @override
  String toJson() => json.encode(toMap());

  @override
  factory SendMoneyTransaction.fromMap(Map<String, dynamic> map) {
    return SendMoneyTransaction(
      id: map['id'],
      transactionId: map['transactionId'],
      amount: map['amount'],
      type: map['type'],
      date: map['date'],
      time: map['time'],
      cost: map['cost'],
      balance: map['balance'],
      recipient: map['recipient'],
      recipientPhone: map['recipientPhone'],
    );
  }

  @override
  factory SendMoneyTransaction.fromJson(String source) =>
      SendMoneyTransaction.fromMap(json.decode(source));

  factory SendMoneyTransaction.fromMessage(String source) {
    // 1. Create a RegExp object
    RegExp pattern = RegExp(
        r'^(.*?) Confirmed\. Ksh([\d,\.]+) sent to (.+) (\d{10}) on (\d{1,2}/\d{1,2}/\d{2}) at (\d{1,2}:\d{2} [AP]M)\. New M-PESA balance is Ksh([\d,\.]+)\. Transaction cost, Ksh([\d,\.]+)\.');

    // 2. Use the firstMatch method
    RegExpMatch? match = pattern.firstMatch(source);

    // 3. Extract the data
    String transactionId = match!.group(1)!;
    String amount = match.group(2)!;
    String recipient = match.group(3)!;
    String recipientPhone = match.group(4)!;
    String date = match.group(5)!;
    String time = match.group(6)!;
    String balance = match.group(7)!;
    String cost = match.group(8)!;

    return SendMoneyTransaction(
      id: '',
      transactionId: transactionId,
      amount: amount,
      date: date,
      time: time,
      cost: cost,
      balance: balance,
      type: 'send_money',
      recipient: recipient,
      recipientPhone: recipientPhone,
    );
  }
}

// This is the base class for all transactions
class BaseTransaction {
  final String id;
  final String transactionId;
  final String amount;
  final String type;
  final String date;
  final String time;
  final String cost;
  final String balance;

  BaseTransaction({
    required this.id,
    required this.transactionId,
    required this.amount,
    required this.type,
    required this.date,
    required this.time,
    required this.cost,
    required this.balance,
  });

  // this method is used to convert the object to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'transactionId': transactionId,
      'amount': amount,
      'type': type,
      'date': date,
      'time': time,
      'cost': cost,
      'balance': balance,
    };
  }

  // this method is used to convert the map to an object
  factory BaseTransaction.fromMap(Map<String, dynamic> map) {
    return BaseTransaction(
      id: map['id'],
      transactionId: map['transactionId'],
      amount: map['amount'],
      type: map['type'],
      date: map['date'],
      time: map['time'],
      cost: map['cost'],
      balance: map['balance'],
    );
  }

  // this method is used to convert the object to a json string
  String toJson() => json.encode(toMap());

  // this method is used to convert the json string to an object
  factory BaseTransaction.fromJson(String source) =>
      BaseTransaction.fromMap(json.decode(source));
}
