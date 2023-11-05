import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rock_w/core/http/app_http.dart';
import 'package:rock_w/features/weather_current/entity/weather_entity.dart';
import 'package:rock_w/features/weather_current/interactor/service/current_service.dart';
import 'package:rock_w/features/weather_current/interactor/service/current_service_impl.dart';

import 'current_service_mock.dart';

class MockHttp extends Mock implements AppHttp {}

void main() {
  final getIt = GetIt.instance;

  setUp(() {
    getIt.reset();

    final mockHttp = MockHttp();
    when(() => mockHttp.get(any())).thenAnswer((_) async => Response(
          requestOptions: RequestOptions(path: 'any path'),
          data: json.decode(currentResponseMock),
          statusCode: 200,
        ));

    getIt.registerLazySingleton<AppHttp>(() => mockHttp);
    getIt.registerLazySingleton<WeatherCurrentService>(
        () => WeatherCurrentServiceImpl());
  });

  test('WeatherCurrentService GET', () async {
    WeatherEntity? result =
        await getIt.get<WeatherCurrentService>().get(1212.0, 89898.0);

    expect(result?.id, '3163858');
    expect(result?.coord['lon'], 10.99);
    expect(result?.coord['lat'], 44.34);
    expect(result?.main, 'Rain');
    expect(result?.descriptiton, 'moderate rain');
    expect(result?.temp, 298.48);
    expect(result?.tempMin, 297.56);
    expect(result?.tempMax, 300.05);
    expect(result?.date, '2022-08-30 – 11:43');
  });
}
