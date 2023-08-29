import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:client/api/api.dart';
import 'package:client/models/transaction.dart';

class TransactionApi {
  final Api api;

  TransactionApi(this.api);

  Future<List<Transaction>> getTransactions() async {
    final response = await http.get(Uri.parse('${api.baseUrl}/transactions'));

    final json = jsonDecode(response.body);

    return json
        .map((transaction) => Transaction.fromJson(transaction))
        .toList();
  }

  Future<Transaction> getTransaction(String id) async {
    final response =
        await http.get(Uri.parse('${api.baseUrl}/transactions/$id'));
    final json = jsonDecode(response.body);
    return Transaction.fromJson(json);
  }

  Future<Transaction> createTransaction(Transaction transaction) async {
    final response = await http.post(
      Uri.parse('${api.baseUrl}/transactions'),
      body: transaction.toJson(),
    );

    final json = jsonDecode(response.body);
    return Transaction.fromJson(json);
  }

  Future<Transaction> updateTransaction(Transaction transaction) async {
    final response = await http.put(
      Uri.parse('${api.baseUrl}/transactions/${transaction.id}'),
      body: transaction.toJson(),
    );
    final json = jsonDecode(response.body);
    return Transaction.fromJson(json);
  }

  Future<void> deleteTransaction(String id) async {
    await http.delete(Uri.parse('/transactions/$id'));
  }
}
