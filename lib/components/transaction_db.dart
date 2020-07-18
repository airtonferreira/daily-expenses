import 'package:daily_expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import '../components/transaction_form.dart';
import '../components/transaction_list.dart';

class TransactionDb extends StatefulWidget {
  @override
  _TransactionDbState createState() => _TransactionDbState();
}

class _TransactionDbState extends State<TransactionDb> {
  final _transactions = [
    Transaction(
      id: '1',
      title: 'XBOX ONE X',
      price: 3059.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'TV SAMSUNG UHD 4K HDR 5"',
      price: 2299.00,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[TransactionList(_transactions), TransactionForm()],
    );
  }
}
