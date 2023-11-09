import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rock_w/features/weather_forecast/entity/forecast_entity.dart';
import 'package:rock_w/features/weather_forecast/interactor/service/forecast_service.dart';
import 'package:rock_w/features/weather_forecast/presenter/forecast_presenter.dart';
import 'package:rock_w/features/weather_forecast/presenter/forecast_state.dart';
import 'package:rock_w/features/weather_forecast/view/weather_forecast_view.dart';

class MockForecastPresenter extends MockBloc<ForecastPresenter, ForecastState>
    implements ForecastPresenter {}

class MockWeatherForecastService extends Mock
    implements WeatherForecastService {}

void main() {
  late MockWeatherForecastService mockWeatherForecastService;
  late MockForecastPresenter mockForecastPresenter;
  final forecastViewArgs = {
    'lon': 0.0,
    'lat': 0.0,
    'color': Colors.blue,
  };

  setUp(() {
    mockForecastPresenter = MockForecastPresenter();
    mockWeatherForecastService = MockWeatherForecastService();
    GetIt.I
        .registerSingleton<WeatherForecastService>(mockWeatherForecastService);
  });

  testWidgets(
      'WeatherForecastView displays CircularProgressIndicator when in ForecastLoadingState',
      (WidgetTester tester) async {
    when(() => mockWeatherForecastService.get(any(), any()))
        .thenAnswer((_) async => forecastEnityMock);
    when(() => mockForecastPresenter.state).thenReturn(ForecastLoadingState());

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<ForecastPresenter>(
          create: (context) => mockForecastPresenter,
          child: WeatherForecastView(args: forecastViewArgs),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets(
      'WeatherForecastView displays error message when in ForecastErrorState',
      (WidgetTester tester) async {
    var errorMessage = "Erro ao carregar os dados";
    when(() => mockForecastPresenter.state)
        .thenReturn(ForecastErrorState(errorMessage));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<ForecastPresenter>(
          create: (context) => mockForecastPresenter,
          child: WeatherForecastView(args: forecastViewArgs),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('NO \n CONNECTION'), findsOneWidget);
  });

  tearDown(() {
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
