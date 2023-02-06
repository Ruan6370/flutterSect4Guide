import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'dart:io';

import 'transactions.dart';

void main() {
  runApp(const PersonalExpenseTracker());
}

class PersonalExpenseTracker extends StatelessWidget {
  const PersonalExpenseTracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expense Tracker',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New shoes', amount: 950.00, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Groceries', amount: 110.00, date: DateTime.now()),
  ];
  late String titleInput;
  late String amountInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Track Your Expenses!'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(
            width: double.infinity,
            child: Card(
              elevation: 5,
              color: Colors.deepPurple,
              child: Text('CHART'),
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Title:',
                    ),
                    onChanged: (val) {
                      titleInput = val;
                    },
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Amount:',
                    ),
                    onChanged: (val) {
                      amountInput = val;
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      debugPrint(titleInput);
                      debugPrint(amountInput);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.deepPurpleAccent,
                    ), 
                    child: const Text(
                      'Add Transaction',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ),
                ]
              ),
            )
          ),
          Column(
            children: transactions.map((tx) {
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
                      )
                    ),
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
                      ]
                    ),
                  ]
                ),
              );
            }).toList(),
          ),
        ]
      ),
    );
  }
}
