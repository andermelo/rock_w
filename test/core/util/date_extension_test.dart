import 'package:flutter_test/flutter_test.dart';
import 'package:rock_w/core/util/date_extension.dart';

void main() {
  group('DateFormatExtension Tests', () {
    test('getWeekdayShort should return the correct short form of the weekday',
        () {
      expect('2023-11-09 – 15:00'.getWeekdayShort(), 'Thu');
      expect('2023-11-10 – 24:00'.getWeekdayShort(), 'Fri');
    });

    test('getFormattedDate should return the correct formatted date string',
        () {
      expect('2023-11-09 – 15:00'.getFormattedDate(), 'Thu, 9 de Nov');
      expect('2023-11-10 – 24:00'.getFormattedDate(), 'Fri, 10 de Nov');
    });

    test('getWeekdayShort should throw FormatException for invalid date format',
        () {
      expect(() => 'invalid-date'.getWeekdayShort(), throwsFormatException);
    });

    test(
        'getFormattedDate should throw FormatException for invalid date format',
        () {
      expect(() => 'invalid-date'.getFormattedDate(), throwsFormatException);
    });
  });
}
