import 'package:pet/src/enums/category_enum.dart';
import 'package:pet/src/models/expence.dart';

class ExpenceBucket {
  const ExpenceBucket({
    required this.category,
    required this.expences,
  });

  ExpenceBucket.forCategory(List<Expence> allExpences, this.category)
      : expences = allExpences
            .where((expence) => expence.category == category)
            .toList();
  final Category category;
  final List<Expence> expences;

  double get totalExpenses {
    double sum = 0.0;

    for (final expence in expences) {
      sum += expence.amount;
    }
    return sum;
  }
}
