import 'package:flutter/material.dart';

class TransactionCreator extends StatelessWidget {
  TransactionCreator({Key? key}) : super(key: key);
  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
                      debugPrint(titleController.text);
                      debugPrint(amountController.text);
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
