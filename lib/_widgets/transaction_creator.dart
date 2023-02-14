import 'package:flutter/material.dart';

class TransactionCreator extends StatefulWidget {
  const TransactionCreator(this.addTx, {Key? key}) : super(key: key);

  final Function addTx;

  @override
  State<TransactionCreator> createState() => _TransactionCreatorState();
}

class _TransactionCreatorState extends State<TransactionCreator> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

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
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => submitData(),
                ),
                TextButton(
                    onPressed: submitData,
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
