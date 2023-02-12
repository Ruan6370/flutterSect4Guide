import 'package:flutter/material.dart';

import '_widgets/transaction_creator.dart';
import '_widgets/transactions_list.dart';
import '_models/transactions.dart';

void main() {
  runApp(const PersonalExpenseTracker());
}

class PersonalExpenseTracker extends StatelessWidget {
  const PersonalExpenseTracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.deepPurpleAccent,
        fontFamily: 'Quicksand',
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            color: Colors.white,
          ),
          // foregroundColor: Colors.white,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'New shoes', amount: 950.00, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Groceries', amount: 110.00, date: DateTime.now()),
  ];

  void _addTransactionItem(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _openTransactionCreator(BuildContext creatorContext) {
    showModalBottomSheet(
      context: creatorContext,
      builder: (creatorContextB) {
        return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: TransactionCreator(_addTransactionItem));
      },
    ); //B for builder...
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Your Expenses!'),
        actions: <Widget>[
          IconButton(
            onPressed: () => _openTransactionCreator(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  color: Theme.of(context).primaryColor,
                  child: const Text('CHART'),
                ),
              ),
              TransactionList(_userTransactions),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _openTransactionCreator(context),
          child: const Icon(Icons.add)),
    );
  }
}
