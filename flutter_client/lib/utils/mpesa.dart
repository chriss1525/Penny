import 'package:telephony/telephony.dart';
import 'package:http/http.dart';

class MpesaService {
  // Function to post messages to api
  // TODO: Future<Response> postMessages(List<Map<String, dynamic>> messages) async {}

  // Function to filter send money messages from a list of messages
  List<Map<String, dynamic>> filterSendMoney(List<SmsMessage> messages) {
    List<Map<String, dynamic>> sendMoneyMessages = [];

    for (var message in messages) {
      if (message.body!.contains(
          RegExp(r'^.* sent to .+ \d{10} on \d{1,2}/\d{1,2}/\d{2}'))) {
        sendMoneyMessages.add(parseSendMoney(message.body!));
      }
    }

    print(sendMoneyMessages);

    // post to api
    // TODO: for (var element in sendMoneyMessages) {}
    return sendMoneyMessages;
  }

  Map<String, dynamic> parseSendMoney(String message) {
    // 1. Create a RegExp object
    RegExp pattern = RegExp(
        r'^(.*?) Confirmed\. Ksh([\d,\.]+) sent to (.+) (\d{10}) on (\d{1,2}/\d{1,2}/\d{2}) at (\d{1,2}:\d{2} [AP]M)\. New M-PESA balance is Ksh([\d,\.]+)\. Transaction cost, Ksh([\d,\.]+)\.');

    // 2. Use the firstMatch method
    RegExpMatch match = pattern.firstMatch(message)!;

    // 3. Extract the data
    String transactionId = match.group(1)!;
    String amount = match.group(2)!;
    String recipient = match.group(3)!;
    String recipientPhone = match.group(4)!;
    String date = match.group(5)!;
    String time = match.group(6)!;
    String balance = match.group(7)!;

    // 4. Return the data
    return {
      'transaction_id': transactionId,
      'amount': amount,
      'recipient': recipient,
      'recipient_phone': recipientPhone,
      'date': date,
      'time': time,
      'balance': balance,
      'type': 'send_money'
    };
  }
}
