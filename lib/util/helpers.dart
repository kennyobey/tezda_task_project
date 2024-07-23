import 'package:intl/intl.dart';

class Utils {
  static String currencyFormat(num value) {
    return NumberFormat.compact().format(value);
  }

  static String addTextSpace(String text) {
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var numberIndex = i + 1;
      if (numberIndex % 4 == 0 && numberIndex != text.length) {
        buffer.write('  ');
      }
    }
    return buffer.toString();
  }
}