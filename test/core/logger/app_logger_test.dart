import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart' as datadog;
import 'package:rock_w/core/logger/app_logger.dart';

class MockDatadogLogger extends Mock implements datadog.DatadogLogger {}

void main() {
  group('AppLogger', () {
    late MockDatadogLogger mockLogger;
    late AppLogger appLogger;

    setUp(() {
      mockLogger = MockDatadogLogger();
      appLogger = AppLogger.instance;
      appLogger.setLogger(mockLogger);
    });

    test('logInfo calls info on DatadogLogger', () {
      appLogger.logInfo('Test Info');

      verify(() => mockLogger.info('Test Info')).called(1);
    });

    test('logWarning calls warn on DatadogLogger', () {
      appLogger.logWarning('Test Warning');

      verify(() => mockLogger.warn('Test Warning')).called(1);
    });

    test('logError calls error on DatadogLogger with correct parameters', () {
      final exception = Exception('Test Exception');

      appLogger.logError('Test Error',
          exception: exception, stackTrace: StackTrace.current);

      final captured = verify(() => mockLogger.error(
            captureAny(),
            errorMessage: captureAny(named: 'errorMessage'),
            errorKind: captureAny(named: 'errorKind'),
            errorStackTrace: captureAny(named: 'errorStackTrace'),
            attributes: captureAny(named: 'attributes'),
          )).captured;
      expect(captured[0], 'Test Error');
      expect(captured[2], 'Exception: Test Exception');
    });
  });
}
