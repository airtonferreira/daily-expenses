import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final price = double.tryParse(_priceController.text) ?? 0.0;

    if (title.isEmpty || price <= 0 || _selectedDate == null) {
      return;
    }

    widget.onSubmit(title, price, _selectedDate);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
      fieldLabelText: 'Selecione uma data',
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
              controller: _titleController,
              decoration: InputDecoration(
                  labelText: 'Nome',
                  labelStyle: TextStyle(color: Theme.of(context).accentColor)),
              onSubmitted: (_) => _submitForm(),
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: _priceController,
              decoration: InputDecoration(
                  labelText: 'Valor (R\$)',
                  labelStyle: TextStyle(color: Theme.of(context).accentColor)),
              onSubmitted: (_) => _submitForm(),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'Nenhuma data selecionada'
                        : DateFormat('dd/MMM/y').format(_selectedDate)),
                  ),
                  FlatButton(
                      onPressed: _showDatePicker,
                      textColor: Theme.of(context).accentColor,
                      child: Text(
                        'Selecionar data',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ],
              ),
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
                    backgroundColor: Theme.of(context).accentColor,
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
