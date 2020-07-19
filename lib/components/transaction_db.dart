import 'dart:math';

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
    ),
    Transaction(
      id: '3',
      title: 'CONTA DE ÁGUA',
      price: 3059.00,
      date: DateTime.now(),
    ),
  ];

  _addTransaction(String title, double price) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        price: price,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionForm(_addTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}
