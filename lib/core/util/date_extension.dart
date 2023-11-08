import 'package:intl/intl.dart';

extension DateFormatExtension on String {
  String getWeekdayShort() {
    DateFormat format = DateFormat("yyyy-MM-dd – HH:mm");
    String correctedString = replaceAll('24:00', '00:00');
    DateTime dateTime = format.parse(correctedString);

    return DateFormat('EEE', 'en_US').format(dateTime);
  }

  String getFormattedDate() {
    DateFormat format = DateFormat("yyyy-MM-dd – HH:mm");
    String correctedString = replaceAll('24:00', '00:00');
    DateTime dateTime = format.parse(correctedString);

    return DateFormat("EEE, d 'de' MMM", "en_US").format(dateTime);
  }
}
