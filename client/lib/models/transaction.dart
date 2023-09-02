import 'dart:convert';

class Transaction {
  // mandatory fields
  final int id;
  final String userId;
  final String transactionId;
  final int amount;
  final String transactionType;
  final String date;
  final String time;
  final int balance;

  // optional fields
  final String cost; // money recieved doesn't have cost

  final String recipientName; // for money sent via send_money and pochi
  final String recipientPhone; // for money sent via send_money

  final String businessName; // for money sent via pay_bill and buy_goods
  final String accountNumber; // for money sent via pay_bill

  final String senderName; // for money recieved via send_money
  final String senderPhone; // for money recieved via send_money

  Transaction({
    this.id = 0,
    this.userId = '',
    required this.transactionId,
    required this.amount,
    required this.transactionType,
    required this.date,
    required this.time,
    required this.balance,
    this.cost = '',
    this.recipientName = '',
    this.recipientPhone = '',
    this.businessName = '',
    this.accountNumber = '',
    this.senderName = '',
    this.senderPhone = '',
  });

  // toMap method
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'transactionId': transactionId,
      'amount': amount,
      'transactionType': transactionType,
      'date': date,
      'time': time,
      'balance': balance,
      'cost': cost,
      'recipientName': recipientName,
      'recipientPhone': recipientPhone,
      'businessName': businessName,
      'accountNumber': accountNumber,
      'senderName': senderName,
      'senderPhone': senderPhone,
    };
  }

  // fromMap method
  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'],
      userId: map['user_id'],
      transactionId: map['transaction_id'],
      amount: map['amount'],
      transactionType: map['transaction_type'],
      date: map['date'],
      time: map['time'],
      balance: map['balance'],
      cost: map['cost'] ?? '',
      recipientName: map['recipient_name'] ?? '',
      recipientPhone: map['recipient_phone'] ?? '',
      businessName: map['businessName'] ?? '',
      accountNumber: map['accountNumber'] ?? '',
      senderName: map['senderName'] ?? '',
      senderPhone: map['senderPhone'] ?? '',
    );
  }

  // toJson method
  String toJson() => json.encode(toMap());

  // fromJson method
  factory Transaction.fromJson(String source) =>
      Transaction.fromMap(json.decode(source));

  // fromMessage method
  factory Transaction.fromMessage(String source) {
    /**
     * check if the message is of type send_money
     * they contain the text sent to, the phone number and the date
     */
    if (source
        .contains(RegExp(r'^.* sent to .+ \d{10} on \d{1,2}/\d{2}/\d{2}'))) {
      // create a RegExp pattern to match the message
      RegExp pattern = RegExp(
        r'^(.*?) Confirmed\. Ksh([\d,\.]+) sent to (.+) (\d{10}) on (\d{1,2}/\d{1,2}/\d{2}) at (\d{1,2}:\d{2} [AP]M)\. New M-PESA balance is Ksh([\d,\.]+)\. Transaction cost, Ksh([\d,\.]+)\.',
      );

      // get the match
      Match match = pattern.firstMatch(source)!;

      return Transaction(
        transactionId: match.group(1)!,
        transactionType: 'send_money',
        amount: match.group(2)! as int,
        recipientName: match.group(3)!,
        recipientPhone: match.group(4)!,
        date: match.group(5)!,
        time: match.group(6)!,
        balance: match.group(7)! as int,
        cost: match.group(8)!,
      );
    } else {
      return Transaction(
        transactionId: '',
        transactionType: 'another_type',
        amount: 0,
        date: '',
        time: '',
        balance: 0,
      );
    }
  }
}
