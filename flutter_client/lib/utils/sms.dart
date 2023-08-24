import 'package:telephony/telephony.dart';

class SmsService {
  final Telephony telephony = Telephony.instance;

  Future<bool?> hasPermission() async {
    return await telephony.requestPhoneAndSmsPermissions;
  }
}
