import 'package:flutter/material.dart';
import 'package:pet/src/enums/category_enum.dart';
import 'package:pet/src/widgets/add_expence.dart';
import 'package:pet/src/widgets/expences_list/expences_list.dart';
import 'package:pet/src/models/expence.dart';

class Expences extends StatefulWidget {
  const Expences({super.key});

  @override
  State<Expences> createState() {
    return _ExpencesState();
  }
}

class _ExpencesState extends State<Expences> {
  final List<Expence> _existingExpences = [
    Expence(
        title: "Ordered Pizza",
        amount: 3400,
        date: DateTime.utc(2023, 09, 29, 15, 30, 30),
        category: Category.food),
    Expence(
        title: "Udemy Java Script",
        amount: 13400,
        date: DateTime.utc(2023, 08, 29, 12, 30, 30),
        category: Category.education),
    Expence(
        title: "New T-shirt",
        amount: 2400,
        date: DateTime.utc(2023, 07, 29, 15, 30, 30),
        category: Category.apparel),
    Expence(
        title: "Friends Birthday Gift",
        amount: 32400,
        date: DateTime.utc(2023, 06, 29, 15, 30, 30),
        category: Category.gift),
  ];

  void _openAddExpensesOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => AddExpence(onSaveExpence: _persistExpence),
    );
  }

  void _persistExpence(Expence expence) {
    setState(() {
      _existingExpences.add(expence);
    });
  }

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Expence Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpensesOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text("Chart"),
          Expanded(
            child: ExpencesList(expences: _existingExpences),
          ),
        ],
      ),
    );
  }
}
