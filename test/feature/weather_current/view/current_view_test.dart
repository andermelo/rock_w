import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rock_w/features/weather_current/entity/weather_entity.dart';
import 'package:rock_w/features/weather_current/interactor/service/current_service.dart';
import 'package:rock_w/features/weather_current/presenter/current_presenter.dart';
import 'package:rock_w/features/weather_current/presenter/current_state.dart';
import 'package:rock_w/features/weather_current/view/weather_current_view.dart';

class MockCurrentPresenter extends MockBloc<CurrentPresenter, CurrentState>
    implements CurrentPresenter {}

class MockWeatherCurrentService extends Mock implements WeatherCurrentService {}

void main() {
  late MockCurrentPresenter mockCurrentPresenter;
  late MockWeatherCurrentService mockWeatherCurrentService;

  setUp(() {
    mockWeatherCurrentService = MockWeatherCurrentService();
    mockCurrentPresenter = MockCurrentPresenter();
    GetIt.I.registerSingleton<WeatherCurrentService>(mockWeatherCurrentService);
  });

  testWidgets(
      'WeatherCurrentView displays error message when in CurrentErrorState',
      (WidgetTester tester) async {
    var errorMessage = "Erro ao carregar os dados";
    when(() => mockCurrentPresenter.state)
        .thenReturn(CurrentErrorState(errorMessage));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<CurrentPresenter>(
          create: (context) => mockCurrentPresenter,
          child: const WeatherCurrentView(),
        ),
      ),
    );

    await tester.pump(Duration.zero);

    expect(find.text('NO \n CONNECTION'), findsOneWidget);
  });

  testWidgets(
      'WeatherCurrentView displays CircularProgressIndicator when in CurrentLoadingState',
      (WidgetTester tester) async {
    when(() => mockCurrentPresenter.state).thenReturn(CurrentLoadingState());

    when(() => mockWeatherCurrentService.get(any(), any()))
        .thenAnswer((_) async => resultMock);

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<CurrentPresenter>(
          create: (context) => mockCurrentPresenter,
          child: const WeatherCurrentView(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  tearDown(() {
    mockCurrentPresenter.close();

    if (GetIt.I.isRegistered<WeatherCurrentService>()) {
      GetIt.I.unregister<WeatherCurrentService>();
    }
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
