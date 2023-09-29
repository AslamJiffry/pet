import 'package:flutter/material.dart';
import 'package:pet/src/models/expence.dart';

class ExpencesList extends StatelessWidget {
  const ExpencesList({super.key, required this.expences});

  final List<Expence> expences;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expences.length,
      itemBuilder: (context, index) => Text(expences[index].title),
    );
  }
}
