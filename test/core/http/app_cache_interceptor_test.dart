import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:rock_w/core/database/app_database.dart';
import 'package:rock_w/core/http/app_cache_interceptor.dart';
import 'package:rock_w/core/database/app_database_impl.dart';
import 'package:rock_w/core/http/app_http.dart';
import 'package:rock_w/core/http/app_http_impl.dart';

class MockConnectivity extends Mock implements Connectivity {}

class MockAppDatabaseImpl extends Mock implements AppDatabaseImpl {}

class RequestOptionsFake extends Fake implements RequestOptions {}

void main() {
  final getIt = GetIt.instance;
  final mockConnectivity = MockConnectivity();
  final mockAppDatabaseImpl = MockAppDatabaseImpl();

  setUp(() async {
    getIt.registerSingleton<Connectivity>(mockConnectivity);
    getIt.registerSingleton<AppDatabase>(mockAppDatabaseImpl);
    getIt.registerSingleton<AppCacheInterceptor>(
      AppCacheInterceptor(
        appDatabase: mockAppDatabaseImpl,
        connectivity: mockConnectivity,
      ),
    );

    registerFallbackValue(RequestOptionsFake());

    when(() => mockConnectivity.checkConnectivity())
        .thenAnswer((_) async => ConnectivityResult.wifi);
    when(() => mockAppDatabaseImpl.getData(any()))
        .thenAnswer((_) async => null);
    when(() => mockAppDatabaseImpl.saveData(any(), any()))
        .thenAnswer((_) async => {});
  });

  tearDown(() {
    getIt.reset();
  });

  test(
      'Interceptor should reject the request when no internet connection and no cached data',
      () async {
    final interceptor = getIt.get<AppCacheInterceptor>();
    when(() => mockConnectivity.checkConnectivity())
        .thenAnswer((_) async => ConnectivityResult.none);

    getIt.registerLazySingleton<AppHttp>(() => AppHttpImpl());
    final appHttp = getIt.get<AppHttp>();

    // Add our interceptor to test in a controlled environment:
    appHttp.addInterceptor(interceptor);

    // Validate our implementation with the expected error:
    expect(
      appHttp
          .get('https://anderson.mobi')
          .catchError((e) => throw e.error as String),
      throwsA('No internet connection and no cached data available.'),
    );
  });

  test('Interceptor should save data on response', () async {
    final responseData = {'key': 'value'};
    final requestOptions = RequestOptions(path: 'https://anderson.mobi');
    final response = Response(
      requestOptions: requestOptions,
      data: responseData,
      statusCode: 200,
    );
    final interceptor = getIt.get<AppCacheInterceptor>();

    interceptor.onResponse(response, ResponseInterceptorHandler());

    // Confirm that our [AppDatabase] saveData method was called
    await untilCalled(() => getIt.get<AppDatabase>().saveData(any(), any()));
    verify(() => getIt.get<AppDatabase>().saveData(requestOptions.path, any()))
        .called(1);
  });

  test('Return cached data if user is without internet', () async {
    final interceptor = getIt.get<AppCacheInterceptor>();

    when(() => mockConnectivity.checkConnectivity())
        .thenAnswer((_) async => ConnectivityResult.none);
    when(() => mockAppDatabaseImpl.getData(any())).thenAnswer((_) async {
      return {
        'data': jsonEncode({'key': 'old_value'}),
        'timestamp': DateTime.now()
            .subtract(const Duration(hours: 1))
            .millisecondsSinceEpoch,
      };
    });

    // Add interceptor to AppHttp for testing
    getIt.registerLazySingleton<AppHttp>(() => AppHttpImpl());
    final appHttp = getIt.get<AppHttp>();
    appHttp.addInterceptor(interceptor);

    // Tests whether the interceptor returns cache data correctly
    final result = await appHttp.get('https://anderson.mobi');
    final data = jsonDecode(result.data);
    expect(data['key'], equals('old_value'));
  });
}

// **************
// Para mais insights e exemplos de testes, sinta-se à vontade para explorar os testes de interceptores do Dio em
// https://github.com/cfug/dio/blob/main/dio/test/interceptor_test.dart 👍
// For additional testing insights and examples, feel free to explore the Dio interceptor tests at
// **************
