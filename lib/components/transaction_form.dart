import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final priceController = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  _submitForm() {
    final title = titleController.text;
    final price = double.tryParse(priceController.text) ?? 0.0;

    if (title.isEmpty || price <= 0) {
      return;
    }

    onSubmit(title, price);
  }

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
              onSubmitted: (_) => _submitForm(),
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: priceController,
              decoration: InputDecoration(
                  labelText: 'Valor (R\$)',
                  labelStyle: TextStyle(color: Colors.deepPurpleAccent)),
              onSubmitted: (_) => _submitForm(),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FloatingActionButton.extended(
                    onPressed: _submitForm,
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
