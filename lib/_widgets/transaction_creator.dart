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

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime.now());
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
                  onSubmitted: (_) => _submitData(),
                ),
                SizedBox(
                  height: 70,
                  child: Row(
                    children: <Widget>[
                      const Text('No Date Chosen!'),
                      TextButton(
                        onPressed: _presentDatePicker,
                        child: const Text(
                          'Choose Date',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: _submitData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: const Text(
                    'Add Transaction',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]),
        ));
  }
}
