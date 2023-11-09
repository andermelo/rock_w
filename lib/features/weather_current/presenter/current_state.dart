import 'package:equatable/equatable.dart';
import 'package:rock_w/features/weather_current/entity/weather_entity.dart';

abstract class CurrentState extends Equatable {}

class CurrentInitialState extends CurrentState {
  @override
  List<Object> get props => [];
}

class CurrentLoadingState extends CurrentState {
  @override
  List<Object> get props => [];
}

class CurrentLoadedState extends CurrentState {
  CurrentLoadedState(this.weatherCurrentCities);

  final List<WeatherEntity> weatherCurrentCities;

  @override
  List<Object> get props => [weatherCurrentCities];
}

class CurrentErrorState extends CurrentState {
  CurrentErrorState(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class CurrentFilteredState extends CurrentState {
  CurrentFilteredState(this.weather);

  final WeatherEntity weather;

  @override
  List<Object> get props => [weather];
}

class CurrentNoResultState extends CurrentState {
  CurrentNoResultState(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
