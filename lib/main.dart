import 'package:flutter/material.dart';
import 'package:helloworld/_widgets/transaction_creator.dart';

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
  const HomePage({Key? key}) : super(key: key);

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
          ]),
    );
  }
}
