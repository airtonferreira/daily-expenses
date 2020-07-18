import 'package:daily_expenses/components/transaction_list.dart';
import 'package:daily_expenses/models/transaction.dart';
import 'package:flutter/material.dart';

import 'components/transaction_form.dart';

main() => runApp(DailyExpensesApp());

class DailyExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
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
    return Scaffold(
        appBar: AppBar(
          title: Text('Despesas Pessoais'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Card(
                color: Colors.blueAccent,
                child: Text('Gráfico'),
                elevation: 5,
              ),
            ),
            TransactionList(_transactions),
            TransactionForm(),
          ],
        ));
  }
}
