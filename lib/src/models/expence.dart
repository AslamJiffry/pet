import 'package:uuid/uuid.dart';
import 'package:pet/src/enums/category_enum.dart';

//To generate uniqueIds
const uuid = Uuid();

class Expence {
  Expence({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}
