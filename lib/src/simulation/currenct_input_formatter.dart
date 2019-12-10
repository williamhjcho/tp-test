import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  CurrencyInputFormatter() : super();

  final formatter = NumberFormat.decimalPattern();

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = '';
    if (newValue.text.isNotEmpty) {
      final amount = int.parse(newValue.text);
      newText = formatter.format(amount);
    }
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
