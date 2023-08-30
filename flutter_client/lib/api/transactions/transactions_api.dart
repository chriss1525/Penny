import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:penny/models/transaction.dart';

typedef Transaction = BaseTransaction;

class TransactionsApi {
  final String baseUrl;

  TransactionsApi({required this.baseUrl});

  Future<List<Transaction>> getTransactions() async {
    var url = Uri.parse('$baseUrl/transactions');
    var response = await http.get(url);
    var data = jsonDecode(response.body);

    List<Transaction> transactions = [];

    for (var item in data) {
      transactions.add(Transaction.fromJson(item));
    }

    return transactions;
  }

  Future<Transaction> getTransaction(String id) async {
    var url = Uri.parse('$baseUrl/transactions/$id');
    var response = await http.get(url);
    var data = jsonDecode(response.body);

    return Transaction.fromJson(data);
  }

  Future<Transaction> createTransaction(Transaction transaction) async {
    var url = Uri.parse('$baseUrl/transactions');
    var response = await http.post(
      url,
      body: transaction.toJson(),
      headers: {'Content-Type': 'application/json'},
    );

    var data = jsonDecode(response.body);

    return Transaction.fromJson(data);
  }
}
