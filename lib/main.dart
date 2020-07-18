import 'package:flutter/material.dart';

import 'components/transaction_db.dart';

main() => runApp(DailyExpensesApp());

class DailyExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Despesas Pessoais'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Card(
                  color: Colors.blueAccent,
                  child: Text('Gráfico'),
                  elevation: 5,
                ),
              ),
              TransactionDb(),
            ],
          ),
        ));
  }
}
