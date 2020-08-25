import 'package:daily_expenses/components/chart.dart';
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
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(accentColor: Colors.deepPurpleAccent),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [
    // Transaction(
    //   id: '1',
    //   title: 'XBOX ONE X',
    //   price: 3059.00,
    //   date: DateTime.now().subtract(Duration(days: 3)),
    // ),
  ];

  List<Transaction> get recentTransactions {
    return _transactions
        .where(
            (transaction) => transaction.date.isAfter(DateTime.now().subtract(
                  Duration(days: 7),
                )))
        .toList();
  }

  _addTransaction(String title, double price, DateTime date) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        price: price,
        date: date);

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
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
            Chart(recentTransactions),
            TransactionList(_transactions, _deleteTransaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (() => _openTransactionModal(context)),
        icon: Icon(Icons.add_circle),
        label: Text('Nova Transação'),
        backgroundColor: Theme.of(context).accentColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
