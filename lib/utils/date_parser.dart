import 'package:intl/intl.dart';

class DateParser {
  static String formatDate(String? date) {
    if (date == null) return 'No Date';

    final dateTime = DateTime.parse(date);
    final format = DateFormat('MMM dd, yyyy');
    return format.format(dateTime);
  }
}
