import 'package:telephony/telephony.dart';

class SmsService {
  final Telephony telephony = Telephony.instance;

  Future<bool?> hasPermission() async {
    return await telephony.requestPhoneAndSmsPermissions;
  }

  // Get sms messages
  Future<List<SmsMessage>> getMessages() async {
    List<SmsMessage> messages = await telephony.getInboxSms();

    return messages;
  }
}
