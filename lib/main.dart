import './widgets/newtransactionadder.dart';
import './widgets/transactionslist.dart';

import './models/transaction.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses Manager',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'OpenSans',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
        ),
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transaction> transactionList = [];

  void _newTransactionAddFunction(String txtitle, double txamount) {
    final newTx = Transaction(
        amount: txamount,
        date: DateTime.now(),
        id: DateTime.now().toString(),
        title: txtitle);

    setState(() {
      transactionList.add(newTx);
    });
  }

  void _transactionAddSheet(BuildContext rCtx) {
    showModalBottomSheet(
      context: rCtx,
      builder: (bCtx) {
        return NewTransactionAdder(_newTransactionAddFunction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ExpensePlanner"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _transactionAddSheet(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Container(
                  width: double.infinity,
                  color: Colors.blue,
                  child: Text("CHART")),
            ),
            TransactionsList(transactionList),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _transactionAddSheet(context),
      ),
    );
  }
}
