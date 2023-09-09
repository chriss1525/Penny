import 'package:client/models/transaction.dart';
import 'package:flutter/material.dart';

class RecordScreen extends StatelessWidget {
  const RecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments! as Map;
    final Transaction transaction = args['transaction'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: const Text('Record Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          scrollDirection: Axis.vertical,
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          children: <Widget>[
            RecordItemCard(
              label: 'Amount',
              transactionItem: transaction.amount.toString(),
            ),
            RecordItemCard(
              label: 'Date',
              transactionItem: transaction.date,
            ),
            RecordItemCard(
              label: 'Category',
              transactionItem: transaction.transactionType,
            ),
            RecordItemCard(
              label: 'Time',
              transactionItem: transaction.time,
            ),
            if (transaction.transactionType == 'send_money')
              RecordItemCard(
                label: 'Recipient',
                transactionItem: transaction.recipientName,
              ),
            if (transaction.transactionType == 'send_money')
              RecordItemCard(
                label: 'Recipient\'s Number',
                transactionItem: transaction.recipientPhone,
              ),
            if (transaction.transactionType == 'send_money')
              RecordItemCard(
                label: 'Cost',
                transactionItem: transaction.cost.toString(),
              ),
          ],
        ),
      ),
    );
  }
}

class RecordItemCard extends StatelessWidget {
  final String transactionItem;
  final String label;

  const RecordItemCard({
    super.key,
    required this.transactionItem,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      elevation: 0.5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              label,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(
              transactionItem,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
