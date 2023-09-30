import '../enums/category_enum.dart';

extension CategoryExtension on Category {
  String get categoryname {
    final words = toString().split('.').last;
    return '${words[0].toUpperCase()}${words.substring(1)}';
  }
}
