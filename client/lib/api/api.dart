import 'package:client/api/auth/auth.dart';
import 'package:client/api/transactions/transaction_api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Api {
  final String baseUrl = dotenv.env['API_URL']!;

  TransactionApi get transaction => TransactionApi(this);
  AuthApi get auth => AuthApi(this);
}
