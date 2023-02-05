import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text('Track Your Expenses!'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 5,
                color: Colors.deepPurple,
                child: Text('CHART'),
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                  elevation: 5,
                  color: Colors.deepPurple,
                  child: Row(children: <Widget>[
                    Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'R: ' + tx.amount.toStringAsFixed(2),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        )),
                    Column(children: <Widget>[
                      Text(
                        tx.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        tx.date.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ]),
                  ]),
                );
              }).toList(),
            ),
          ]),
    );
  }
}
