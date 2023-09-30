import 'package:flutter/material.dart';

class AddExpence extends StatefulWidget {
  const AddExpence({super.key});

  @override
  State<AddExpence> createState() {
    return _AddExpenseState();
  }
}

class _AddExpenseState extends State<AddExpence> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _loadDatePicker() {
    final current = DateTime.now();
    final initialDate = DateTime(current.year - 1, current.month, current.day);
    final lastDate = current;
    print('insideDatePicker');
    showDatePicker(
        context: context,
        initialDate: current,
        firstDate: initialDate,
        lastDate: lastDate);
    print('aftershowDatePicker');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
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
                  const Text('Selected Date'),
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
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                  print(_amountController.text);
                },
                child: const Text('Save Expence'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
