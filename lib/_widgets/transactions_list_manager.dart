import 'package:flutter/material.dart';

import '../_widgets/transaction_creator.dart';
import '../_widgets/transactions_list.dart';
import '../_models/transactions.dart';

class TransactionsManager extends StatefulWidget {
  const TransactionsManager({Key? key}) : super(key: key);

  @override
  _ManagerState createState() => _ManagerState();
}

class _ManagerState extends State<TransactionsManager> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionCreator(_addTransactionItem),
        TransactionList(_userTransactions),
      ],
    );
  }
}
