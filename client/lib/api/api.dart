import 'package:client/api/auth/auth.dart';
import 'package:client/api/transactions/transaction_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  final String baseUrl = 'http://3.89.155.130';

  TransactionApi get transaction => TransactionApi(this);
  AuthApi get auth => AuthApi(this);

  // get http header with cookie set
  Future<Map<String, String>> getHeader() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cookie = prefs.getString('cookie');

    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Cookie': cookie ?? '',
    };
  }

  // get cookie from shared preferences
  Future<String?> getCookie() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('cookie');
  }

  // set cookie to shared preferences
  Future<void> setCookie(String cookie) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('cookie', cookie);
  }
}
