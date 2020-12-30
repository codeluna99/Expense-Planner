import 'package:flutter/material.dart';

class NewTransactionAdder extends StatefulWidget {
  final Function newTrans;

  NewTransactionAdder(this.newTrans);

  @override
  _NewTransactionAdderState createState() => _NewTransactionAdderState();
}

class _NewTransactionAdderState extends State<NewTransactionAdder> {
  final titlecontroller = TextEditingController();

  final amountcontroller = TextEditingController();

  submitData() {
    String titleInput = titlecontroller.text;
    double amountInput = double.parse(amountcontroller.text);

    if (titleInput.isEmpty || amountInput <= 0) {
      return;
    }
    widget.newTrans(titleInput, amountInput);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
                decoration: InputDecoration(labelText: "Title"),
                controller: titlecontroller,
                onSubmitted: (_) => submitData()),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountcontroller,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              onPressed: submitData,
              child: Text(
                "Add Transaction",
                style: TextStyle(color: Colors.purple),
              ),
            )
          ],
        ),
      ),
    );
  }
}
