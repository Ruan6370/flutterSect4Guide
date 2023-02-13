import 'package:flutter/material.dart';
import 'package:helloworld/custom_components/custom_fonts.dart';
import 'package:intl/intl.dart';

import '../_models/transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionItems;

  const TransactionList(this.transactionItems);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: transactionItems.isEmpty
            ? Column(children: <Widget>[
                const Text('No items to display...',
                    style: CustomFonts.bodyMissing),
                const SizedBox(height: 100),
                SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover)),
              ])
            : ListView.builder(
                itemBuilder: (ctx, index) {
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
                              color: Theme.of(context).colorScheme.secondary,
                              width: 4,
                            ),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'R' +
                                transactionItems[index]
                                    .amount
                                    .toStringAsFixed(2),
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
                              transactionItems[index].title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.deepPurple,
                              ),
                            ),
                            Text(
                              DateFormat.yMMMd()
                                  .format(transactionItems[index].date),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ]),
                    ]),
                  );
                },
                itemCount: transactionItems.length,
              ));
  }
}
