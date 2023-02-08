import 'dart:js_util';

import 'package:flutter/material.dart';
import './transactions_list_manager.dart';

class TransactionCreator extends StatelessWidget {
  TransactionCreator(this.addTx, {Key? key}) : super(key: key);
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  controller: titleController,
                ),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Amount:',
                  ),
                  controller: amountController,
                ),
                TextButton(
                    onPressed: () {
                      addTx(titleController.text,
                          double.parse(amountController.text));
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
                    )),
              ]),
        ));
  }
}
