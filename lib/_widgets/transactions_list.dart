import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../_models/transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionItems;

  TransactionList(this.transactionItems);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactionItems.map((tx) {
        return Card(
          elevation: 5,
          child: Row(children: <Widget>[
            Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.deepPurpleAccent,
                    width: 4,
                  ),
                ),
                padding: const EdgeInsets.all(10),
                child: Text(
                  'R' + tx.amount.toStringAsFixed(2),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.deepPurpleAccent,
                  ),
                )),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    tx.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.deepPurple,
                    ),
                  ),
                  Text(
                    DateFormat.yMMMd().format(tx.date),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ]),
          ]),
        );
      }).toList(),
    );
  }
}
