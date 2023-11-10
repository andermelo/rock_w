import 'package:flutter_test/flutter_test.dart';
import 'package:rock_w/core/util/temperature_extension.dart';

void main() {
  group('Temperature Extension Tests', () {
    test('toCelsiusFromKelvinString should convert Kelvin to Celsius correctly',
        () {
      expect(273.15.toCelsiusFromKelvinString(), '0.0°C');
      expect(0.0.toCelsiusFromKelvinString(), '-273.1°C');
      expect(310.15.toCelsiusFromKelvinString(), '37.0°C');
    });

    test('toCelsiusFromKelvinString should format the Celsius string correctly',
        () {
      double kelvin = 300.0;
      String celsiusString = kelvin.toCelsiusFromKelvinString();
      expect(celsiusString, isA<String>());
      expect(celsiusString.endsWith('°C'), isTrue);
      expect(celsiusString.contains('.'), isTrue);
    });

    test('toCelsiusFromKelvinString should handle large and small numbers', () {
      expect(1000.0.toCelsiusFromKelvinString(), '726.9°C');
      expect(0.0001.toCelsiusFromKelvinString(), '-273.1°C');
    });
  });
}
