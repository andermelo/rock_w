import 'package:equatable/equatable.dart';
import 'package:rock_w/features/weather_forecast/entity/forecast_entity.dart';

abstract class ForecastState extends Equatable {}

class ForecastInitialState extends ForecastState {
  @override
  List<Object> get props => [];
}

class ForecastLoadingState extends ForecastState {
  @override
  List<Object> get props => [];
}

class ForecastLoadedState extends ForecastState {
  ForecastLoadedState(this.forecastEntity);

  final ForecastEntity forecastEntity;

  @override
  List<Object> get props => [forecastEntity];
}

class ForecastErrorState extends ForecastState {
  ForecastErrorState(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
