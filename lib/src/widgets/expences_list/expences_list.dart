import 'package:flutter/material.dart';
import 'package:pet/src/models/expence.dart';
import 'package:pet/src/widgets/expences_list/expence_item.dart';

class ExpencesList extends StatelessWidget {
  const ExpencesList(
      {super.key, required this.expences, required this.onDeleteExpence});

  final List<Expence> expences;
  final void Function(Expence expence) onDeleteExpence;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expences.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expences[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(
                0.70,
              ),
          margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal),
        ),
        onDismissed: (direction) {
          onDeleteExpence(expences[index]);
        },
        child: ExpenceItem(expences[index]),
      ),
    );
  }
}
