import 'package:telephony/telephony.dart';

class SmsService {
  final Telephony telephony = Telephony.instance;

  // check and request for permissions
  Future<bool?> checkPermission() async {
    return await telephony.requestPhoneAndSmsPermissions;
  }

  // get all mpesa messages
  Future<List<SmsMessage>> getAllMessages() async {
    List<SmsMessage> allSms = await telephony.getInboxSms();

    return allSms.where((sms) => sms.address == 'MPESA').toList();
  }
}
