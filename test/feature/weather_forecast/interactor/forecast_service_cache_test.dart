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
import 'package:rock_w/features/weather_forecast/entity/forecast_entity.dart';
import 'package:rock_w/features/weather_forecast/interactor/service/forecast_service.dart';
import 'package:rock_w/features/weather_forecast/interactor/service/forecast_service_impl.dart';

import 'forecast_service_mock.dart';

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
    getIt.registerLazySingleton<WeatherForecastService>(
        () => WeatherForecastServiceImpl());

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

  group('WeatherForecastService interceptor GET with cache', () {
    test('Without internet and local cache saved', () async {
      // configure connection disconnected
      when(() => mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.none);
      // configures simulated return for saved cache
      when(() => mockAppDatabaseImpl.getData(any())).thenAnswer((_) async {
        return {
          'data': jsonDecode(forecastResponseMock),
          'timestamp': DateTime.now()
              .subtract(const Duration(hours: 1))
              .millisecondsSinceEpoch,
        };
      });

      ForecastEntity? result =
          await getIt.get<WeatherForecastService>().get(1212.0, 89898.0);

      // Here is a validation to confirm that we are calling our correct [getData] method in the interceptor:
      await untilCalled(() => getIt.get<AppDatabase>().getData(any()));
      verify(() => getIt.get<AppDatabase>().getData(any())).called(1);

      // others verify
      expect(result.cityId, '3448439');
      expect(result.name, 'São Paulo');
      expect(result.country, 'BR');
      expect(result.forecast.length, 5);
      expect(result.forecast.first.temp, 300.13);
      expect(result.forecast.first.tempMin, 298.44);
      expect(result.forecast.first.tempMax, 300.13);
      expect(result.forecast.first.date, '2023-11-08 – 21:00');
    });
  });
}
