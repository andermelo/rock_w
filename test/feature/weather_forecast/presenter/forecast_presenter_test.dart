import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rock_w/features/weather_forecast/entity/forecast_entity.dart';
import 'package:rock_w/features/weather_forecast/interactor/presenter/forecast_presenter.dart';
import 'package:rock_w/features/weather_forecast/interactor/presenter/forecast_state.dart';
import 'package:rock_w/features/weather_forecast/interactor/service/forecast_service.dart';

class MockWeatherForecastService extends Mock
    implements WeatherForecastService {}

void main() {
  late ForecastPresenter forecastPresenter;
  late MockWeatherForecastService mockWeatherForecastService;

  setUp(() {
    mockWeatherForecastService = MockWeatherForecastService();
    GetIt.I
        .registerSingleton<WeatherForecastService>(mockWeatherForecastService);

    forecastPresenter = ForecastPresenter();
  });

  blocTest<ForecastPresenter, ForecastState>(
    'emits [ForecastLoadingState, ForecastLoadedState] when weatherForecastForNDays is successful',
    build: () {
      when(() => mockWeatherForecastService.get(any(), any()))
          .thenAnswer((_) async => forecastEnityMock);

      return forecastPresenter;
    },
    act: (presenter) => presenter.weatherForecastForNDays(0.0, 0.0),
    expect: () => [
      isA<ForecastLoadingState>(),
      isA<ForecastLoadedState>(),
    ],
    verify: (_) {
      verify(() => mockWeatherForecastService.get(0.0, 0.0)).called(1);
    },
  );

  blocTest<ForecastPresenter, ForecastState>(
    'emits [ForecastLoadingState, ForecastErrorState] when weatherForecastForNDays fails',
    build: () {
      when(() => mockWeatherForecastService.get(any(), any()))
          .thenThrow(Exception('Failed to load weather forecast'));

      return forecastPresenter;
    },
    act: (presenter) => presenter.weatherForecastForNDays(0.0, 0.0),
    expect: () => [
      isA<ForecastLoadingState>(),
      isA<ForecastErrorState>(),
    ],
    verify: (_) {
      verify(() => mockWeatherForecastService.get(0.0, 0.0)).called(1);
    },
  );

  tearDown(() {
    forecastPresenter.close();
    GetIt.I.unregister<WeatherForecastService>();
  });
}

ForecastEntity forecastEnityMock = const ForecastEntity(
  cityId: 'cityId',
  name: 'name',
  country: 'country',
  forecast: [],
  consultedAt: 'consultedAt',
);
