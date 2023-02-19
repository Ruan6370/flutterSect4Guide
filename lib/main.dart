import 'package:flutter/material.dart';

import '_widgets/transaction_creator.dart';
import '_widgets/transactions_list.dart';
import '_widgets/chart.dart';
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
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'QuickSand'),
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
    Transaction(
        id: 't3', title: 'New shoes', amount: 950.00, date: DateTime.now()),
    Transaction(
        id: 't4', title: 'New shoes', amount: 950.00, date: DateTime.now()),
    Transaction(
        id: 't5', title: 'New shoes', amount: 950.00, date: DateTime.now()),
    Transaction(
        id: 't6', title: 'New shoes', amount: 950.00, date: DateTime.now()),
    Transaction(
        id: 't7', title: 'New shoes', amount: 950.00, date: DateTime.now()),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addTransactionItem(
      String txTitle, double txAmount, DateTime selectedDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: selectedDate,
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
    ); //creatorContextB for builder...
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) {
        return tx.id == id;
      });
    });
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
              Chart(_recentTransactions),
              TransactionList(_userTransactions, _deleteTransaction),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _openTransactionCreator(context),
          child: const Icon(Icons.add)),
    );
  }
}
