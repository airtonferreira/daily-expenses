import 'package:daily_expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

main() => runApp(DailyExpensesApp());

class DailyExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  final titleController = TextEditingController();
  final priceController = TextEditingController();

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
            Column(
              children: _transactions.map((tr) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.deepPurpleAccent, width: 2)),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'R\$ ${tr.price.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.deepPurpleAccent),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            tr.title,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat('d MMM y').format(tr.date),
                            style: TextStyle(color: Colors.grey.shade700),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                          labelText: 'Nome',
                          labelStyle:
                              TextStyle(color: Colors.deepPurpleAccent)),
                    ),
                    TextField(
                      controller: priceController,
                      decoration: InputDecoration(
                          labelText: 'Valor (R\$)',
                          labelStyle:
                              TextStyle(color: Colors.deepPurpleAccent)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FloatingActionButton.extended(
                            onPressed: () {
                              print(
                                  'Nome: ${titleController.text} Preço: ${priceController.text}');
                            },
                            icon: Icon(Icons.add_circle),
                            label: Text('Nova Transação'),
                            backgroundColor: Colors.deepPurpleAccent,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
