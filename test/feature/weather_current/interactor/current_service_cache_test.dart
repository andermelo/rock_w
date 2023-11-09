import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rock_w/core/database/app_database.dart';
import 'package:rock_w/core/database/app_database_impl.dart';
import 'package:rock_w/core/http/app_cache_interceptor.dart';
import 'package:rock_w/core/http/app_http.dart';
import 'package:rock_w/core/http/app_http_impl.dart';
import 'package:rock_w/features/weather_current/entity/weather_entity.dart';
import 'package:rock_w/features/weather_current/interactor/service/current_service.dart';
import 'package:rock_w/features/weather_current/interactor/service/current_service_impl.dart';

import 'current_service_mock.dart';

class MockConnectivity extends Mock implements Connectivity {}

class MockAppDatabaseImpl extends Mock implements AppDatabaseImpl {}

class RequestOptionsFake extends Fake implements RequestOptions {}

void main() {
  final getIt = GetIt.instance;
  final mockConnectivity = MockConnectivity();
  final mockAppDatabaseImpl = MockAppDatabaseImpl();

  setUp(() {
    getIt.registerSingleton<Connectivity>(mockConnectivity);
    getIt.registerSingleton<AppDatabase>(mockAppDatabaseImpl);
    getIt.registerSingleton<AppCacheInterceptor>(
      AppCacheInterceptor(
        appDatabase: mockAppDatabaseImpl,
        connectivity: mockConnectivity,
      ),
    );
    getIt.registerLazySingleton<AppHttp>(() => AppHttpImpl());
    getIt.registerLazySingleton<WeatherCurrentService>(
        () => WeatherCurrentServiceImpl());

    registerFallbackValue(RequestOptionsFake());

    // here we include the custom interceptor in our abstraction for Dio
    getIt.get<AppHttp>().addInterceptor(getIt.get<AppCacheInterceptor>());

    when(() => mockAppDatabaseImpl.getData(any()))
        .thenAnswer((_) async => null);
    when(() => mockAppDatabaseImpl.saveData(any(), any()))
        .thenAnswer((_) async => {});
  });

  tearDown(() {
    getIt.reset();
  });

  group('WeatherCurrentService interceptor GET with cache', () {
    test('Without internet and local cache saved', () async {
      // configure connection disconnected
      when(() => mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.none);
      // configures simulated return for saved cache
      when(() => mockAppDatabaseImpl.getData(any())).thenAnswer((_) async {
        return {
          'data': jsonDecode(currentResponseMock),
          'timestamp': DateTime.now()
              .subtract(const Duration(hours: 1))
              .millisecondsSinceEpoch,
        };
      });

      WeatherEntity? result =
          await getIt.get<WeatherCurrentService>().get(1212.0, 89898.0);

      // Here is a validation to confirm that we are calling our correct [getData] method in the interceptor:
      await untilCalled(() => getIt.get<AppDatabase>().getData(any()));
      verify(() => getIt.get<AppDatabase>().getData(any())).called(1);

      // others verify
      expect(result.id, '3163858');
      expect(result.coord['lon'], 10.99);
      expect(result.coord['lat'], 44.34);
      expect(result.main, 'Rain');
      expect(result.description, 'moderate rain');
      expect(result.temp, 298.48);
      expect(result.tempMin, 297.56);
      expect(result.tempMax, 300.05);
    });
  });
}
