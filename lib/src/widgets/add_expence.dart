import 'package:flutter/material.dart';
import 'package:pet/src/enums/category_enum.dart';
import 'package:pet/src/extentions/category_extension.dart';
import 'package:pet/src/models/expence.dart';

class AddExpence extends StatefulWidget {
  const AddExpence({super.key, required this.onSaveExpence});

  final void Function(Expence expence) onSaveExpence;

  @override
  State<AddExpence> createState() {
    return _AddExpenseState();
  }
}

class _AddExpenseState extends State<AddExpence> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDateVar;
  Category _selectedCategory = Category.food;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _loadDatePicker() async {
    final current = DateTime.now();
    final initialDate = DateTime(current.year - 1, current.month, current.day);
    final lastDate = current;
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: current,
        firstDate: initialDate,
        lastDate: lastDate);

    setState(() {
      _selectedDateVar = selectedDate;
    });
  }

  void _saveExpence() {
    final amount = double.tryParse(_amountController.text);
    final amountIsInvalid = amount == null || amount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDateVar == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text('Please check entered data valid or empty!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Ok'),
            ),
          ],
        ),
      );
      return;
    }
    widget.onSaveExpence(
      Expence(
          title: _titleController.text,
          amount: amount,
          date: _selectedDateVar!,
          category: _selectedCategory),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 48, 20, 20),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: 'Rs:',
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _selectedDateVar == null
                        ? 'No Date Selected'
                        : formatter.format(_selectedDateVar!),
                  ),
                  IconButton(
                    onPressed: _loadDatePicker,
                    icon: const Icon(
                      Icons.calendar_month,
                    ),
                  ),
                ],
              )),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(
                          category.categoryname,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: _saveExpence,
                child: const Text('Save Expence'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
