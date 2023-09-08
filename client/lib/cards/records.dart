import 'package:client/api/api.dart';
import 'package:flutter/material.dart';

class Records extends StatelessWidget {
  const Records({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Records',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            FutureBuilder(
              future: Api().transaction.getTransactions(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Record(
                        transactionId: snapshot.data![index].transactionId,
                        category: 'category',
                        amount: snapshot.data![index].amount,
                        date: snapshot.data![index].date,
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                // By default, show a loading spinner. but constrained to 200
                return const SizedBox(
                  height: 200,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
            TextButton(
              style: TextButton.styleFrom(alignment: Alignment.centerLeft),
              onPressed: () {
                Navigator.pushNamed(context, '/transactions');
              },
              child: const Text('View all'),
            ),
          ],
        ),
      ),
    );
  }
}

class Record extends StatelessWidget {
  final String transactionId;
  final String category;
  final int amount;
  final String date;

  const Record({
    super.key,
    required this.transactionId,
    required this.category,
    required this.amount,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        ListTile(
          visualDensity: const VisualDensity(vertical: -4.0),
          leading: Icon(
            Icons.attach_money,
            color: Theme.of(context).colorScheme.secondary,
          ),
          // title has both category and amount of transaction
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                transactionId,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                amount.toString(),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          // conditional note of the transaction
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                category,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
          // date of the transaction
        ),
      ],
    );
  }
}
