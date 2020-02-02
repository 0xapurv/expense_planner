import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function newTx;

  NewTransaction(this.newTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitText() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.newTx(enteredTitle, enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted: (_) => submitText(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                controller: amountController,
                onSubmitted: (_) => submitText(),
              ),
              FlatButton(
                child: Text('Add Transaction'),
                textColor: Theme.of(context).primaryColorDark,
                onPressed: submitText,
              )
            ],
          )),
    );
  }
}
