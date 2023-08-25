import 'package:penny/api/transactions/transactions_api.dart';

class Api {
  final String baseUrl = 'http://localhost:3000/';

  transactions(String baseUrl) async {
    return TransactionsApi(baseUrl: baseUrl);
  }
}
