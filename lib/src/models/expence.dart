import 'package:uuid/uuid.dart';
import 'package:pet/src/enums/category_enum.dart';
import 'package:intl/intl.dart';

//To generate uniqueIds
const uuid = Uuid();
//creates a formatter object
final formatter = DateFormat.yMd();

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

  String get formattedDate {
    return formatter.format(date);
  }
}
