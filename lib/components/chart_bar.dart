import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double price;
  final double percentage;

  ChartBar({this.label, this.price, this.percentage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('R\$${price.toStringAsFixed(2)}'),
        SizedBox(height: 5),
        Container(
          height: 60,
          width: 10,
          child: null,
        ),
        SizedBox(height: 5),
        Text(label)
      ],
    );
  }
}
