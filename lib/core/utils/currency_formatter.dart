import 'package:intl/intl.dart';

class CurrencyFormat {
  static String format(double amount, {String symbol = '৳'}) {
    final format = NumberFormat.currency(
      locale: 'en_US', // safer locale
      symbol: symbol,
      decimalDigits: 2,
    );
    return format.format(amount);
  }

  static String formatWithoutSymbol(double amount) {
    final format = NumberFormat('#,##0.00', 'en_US');
    return format.format(amount);
  }
}

// Text(CurrencyFormat.format(999.99)); // ৳999.99
// Text(CurrencyFormat.formatWithoutSymbol(12000)); // 12,000.00
