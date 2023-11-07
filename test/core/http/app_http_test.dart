import 'package:flutter_test/flutter_test.dart';
import 'package:rock_w/core/http/app_http_impl.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('AppHttpImpl', () {
    late MockDio mockDio;
    late AppHttpImpl appHttp;
    const testPath = 'http://anderson.mobi';

    setUp(() {
      mockDio = MockDio();
      appHttp = AppHttpImpl(dio: mockDio);
    });

    test('should perform a GET request and return data on success', () async {
      final responseData = {'key': 'value'};
      when(() =>
          mockDio.get(any(),
              queryParameters: any(named: 'queryParameters'),
              options: any(named: 'options'))).thenAnswer((_) async => Response(
            requestOptions: RequestOptions(path: testPath),
            data: responseData,
            statusCode: 200,
          ));

      final result = await appHttp.get(testPath);

      expect(result.data, responseData);
      verify(() => mockDio.get(testPath)).called(1);
    });

    test('should throw an exception when Dio throws a DioError', () {
      when(() => mockDio.get(any(),
          queryParameters: any(named: 'queryParameters'),
          options: any(named: 'options'))).thenThrow(DioException(
        requestOptions: RequestOptions(path: testPath),
        error: 'Error',
      ));

      expect(appHttp.get(testPath), throwsA(isA<DioException>()));
    });
  });
}
