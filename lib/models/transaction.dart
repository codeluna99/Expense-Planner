import 'package:flutter/cupertino.dart';

class Transaction {
  String title;
  double amount;
  DateTime date;
  String id;

  Transaction(
      {@required this.amount,
      @required this.date,
      @required this.id,
      @required this.title});
}
