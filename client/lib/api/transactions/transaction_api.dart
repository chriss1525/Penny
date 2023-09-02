import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:client/api/api.dart';
import 'package:client/models/transaction.dart';

class TransactionApi {
  final Api api;

  TransactionApi(this.api);

  Future<List<Transaction>> getTransactions() async {
    final response = await http.get(
      Uri.parse('${api.baseUrl}/transactions'),
      headers: await api.getHeader(),
    );

    final json = jsonDecode(response.body);

    if (json['error'] != null) {
      debugPrint(json.toString());
      throw Exception(json['error']);
    }

    if (json['data'] == null) {
      return [];
    }

    final transactions = <Transaction>[];

    // create a list of transactions from json
    for (var transaction in json['data']) {
      transactions.add(Transaction.fromMap(transaction));
    }

    return transactions;
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
      headers: await api.getHeader(),
    );

    final json = jsonDecode(response.body);
    return Transaction.fromJson(json);
  }

  Future<Transaction> updateTransaction(Transaction transaction) async {
    final response = await http.put(
      Uri.parse('${api.baseUrl}/transactions/${transaction.id}'),
      body: transaction.toJson(),
      headers: await api.getHeader(),
    );
    final json = jsonDecode(response.body);
    return Transaction.fromJson(json);
  }

  Future<void> deleteTransaction(String id) async {
    await http.delete(
      Uri.parse('/transactions/$id'),
      headers: await api.getHeader(),
    );
  }
}
