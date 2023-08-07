import 'package:intl/intl.dart';

class FormatAngka {
  static String convertToIdr(dynamic number, int decimalDigit) {
    NumberFormat toIDR = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: decimalDigit,
    );
    return toIDR.format(number);
  }
}
