import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class PointsInputFormatter extends TextInputFormatter {
  PointsInputFormatter() : super();

  final formatter = NumberFormat.decimalPattern();

  String format(int points) => formatter.format(points);

  int parse(String text) => formatter.parse(text)?.toInt();

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
