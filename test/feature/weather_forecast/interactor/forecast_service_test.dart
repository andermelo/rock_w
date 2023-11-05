import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rock_w/core/http/app_http.dart';
import 'package:rock_w/features/weather_forecast/entity/forecast_entity.dart';
import 'package:rock_w/features/weather_forecast/interactor/service/forecast_service.dart';
import 'package:rock_w/features/weather_forecast/interactor/service/forecast_service_impl.dart';

import 'forecast_service_mock.dart';

class MockHttp extends Mock implements AppHttp {}

void main() {
  final getIt = GetIt.instance;

  setUp(() {
    getIt.reset();

    final mockHttp = MockHttp();
    when(() => mockHttp.get(any())).thenAnswer((_) async => Response(
          requestOptions: RequestOptions(path: 'any path'),
          data: json.decode(forecastResponseMock),
          statusCode: 200,
        ));

    getIt.registerLazySingleton<AppHttp>(() => mockHttp);
    getIt.registerLazySingleton<WeatherForecastService>(
        () => WeatherForecastServiceImpl());
  });

  test('WeatherForecastService GET:', () async {
    ForecastEntity? result =
        await getIt.get<WeatherForecastService>().get(1212.0, 89898.0);

    expect(result.cityId, '3163858');
  });
}
