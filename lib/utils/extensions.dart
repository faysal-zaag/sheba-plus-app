extension IndexedMap<T> on List<T> {
  List<R> mapWithIndex<R>(R Function(int index, T value) transform) {
    return asMap().entries.map((entry) {
      return transform(entry.key, entry.value);
    }).toList();
  }
}

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}
