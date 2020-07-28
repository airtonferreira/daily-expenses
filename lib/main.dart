import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';
import 'dart:math';

main() => runApp(DailyExpensesApp());

class DailyExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

    Navigator.of(context).pop();
  }

  _openTransactionModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
  }

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
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (() => _openTransactionModal(context)),
        icon: Icon(Icons.add_circle),
        label: Text('Nova Transação'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
