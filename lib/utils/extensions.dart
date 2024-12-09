import 'package:collection/collection.dart';

extension IndexedMap<T> on List<T> {
  List<R> mapWithIndex<R>(R Function(int index, T value) transform) {
    return asMap().entries.map((entry) {
      return transform(entry.key, entry.value);
    }).toList();
  }
}

extension StringExtension on String {
  String toCamelCase() {
    return split(' ')
        .mapIndexed((index, word) =>
    index == 0 ? word.toLowerCase() : word.capitalizeFirst())
        .join();
  }
}

extension CapitalizeFirst on String {
  String capitalizeFirst() =>
      isNotEmpty ? this[0].toUpperCase() + substring(1).toLowerCase() : this;
}