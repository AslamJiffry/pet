import 'package:flutter/material.dart';
import 'package:pet/src/models/expence.dart';

class ExpenceItem extends StatelessWidget {
  const ExpenceItem(this.expence, {super.key});

  final Expence expence;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(expence.title),
    );
  }
}
