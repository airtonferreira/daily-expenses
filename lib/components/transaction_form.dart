import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  labelText: 'Nome',
                  labelStyle: TextStyle(color: Colors.deepPurpleAccent)),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(
                  labelText: 'Valor (R\$)',
                  labelStyle: TextStyle(color: Colors.deepPurpleAccent)),
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
    );
  }
}