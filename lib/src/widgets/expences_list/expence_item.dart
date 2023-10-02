import 'package:flutter/material.dart';
import 'package:pet/src/enums/category_icons.dart';
import 'package:pet/src/models/expence.dart';

class ExpenceItem extends StatelessWidget {
  const ExpenceItem(this.expence, {super.key});

  final Expence expence;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(
              expence.title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text('Rs:${expence.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expence.category]),
                    const SizedBox(width: 8),
                    Text(expence.formattedDate),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
