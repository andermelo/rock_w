import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rock_w/features/weather_current/entity/weather_entity.dart';
import 'package:rock_w/features/weather_current/interactor/service/current_service.dart';
import 'package:rock_w/features/weather_current/presenter/current_presenter.dart';
import 'package:rock_w/features/weather_current/presenter/current_state.dart';

class MockWeatherCurrentService extends Mock implements WeatherCurrentService {}

void main() {
  late CurrentPresenter currentPresenter;
  late MockWeatherCurrentService mockWeatherCurrentService;

  setUp(() {
    mockWeatherCurrentService = MockWeatherCurrentService();
    GetIt.I.registerSingleton<WeatherCurrentService>(mockWeatherCurrentService);
    TestWidgetsFlutterBinding.ensureInitialized();
    currentPresenter = CurrentPresenter();
  });

  blocTest<CurrentPresenter, CurrentState>(
    'emits [CurrentLoadingState, CurrentLoadedState] when doWeatherCurrentWithCities is successful',
    setUp: () {
      when(() => mockWeatherCurrentService.get(any(), any()))
          .thenAnswer((_) async => resultMock);
    },
    build: () => CurrentPresenter(),
    act: (presenter) => presenter.doWeatherCurrentWithCities(),
    expect: () => [
      isA<CurrentLoadingState>(),
      isA<CurrentLoadedState>(),
    ],
    verify: (_) {
      verify(() => mockWeatherCurrentService.get(any(), any())).called(4);
    },
  );

  tearDown(() {
    currentPresenter.close();
    GetIt.I.unregister<WeatherCurrentService>();
  });
}

WeatherEntity resultMock = const WeatherEntity(
  id: '324',
  coord: {"lon": 0.0, "lat": 0.0},
  name: "Sao Paulo",
  country: "BR",
  main: "Sun",
  description: "description",
  temp: 33.0,
  tempMin: 19.0,
  tempMax: 35.0,
  date: '2022-08-30 – 11:43',
);
