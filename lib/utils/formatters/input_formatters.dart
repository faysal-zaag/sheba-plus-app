import 'package:flutter/services.dart';

class InputFormatters {
  static final numberOnly = TextInputFormatter.withFunction(
        (oldValue, newValue) {
      final text = newValue.text;

      if (text.isEmpty) return newValue;

      final regex = RegExp(r'^(0|[1-9]\d*)(\.\d*)?$');
      if (regex.hasMatch(text)) {
        return newValue;
      }

      return oldValue;
    },
  );
}
