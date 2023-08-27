import 'package:client/api/transaction_api.dart';

class Api {
  final String baseUrl = 'http://localhost:3000';

  TransactionApi get transactionApi => TransactionApi(this);
}
