import 'package:client/api/auth/auth.dart';
import 'package:client/api/transactions/transaction_api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Api {
  final String baseUrl = 'http://3.89.155.130';

  TransactionApi get transaction => TransactionApi(this);
  AuthApi get auth => AuthApi(this);
}
