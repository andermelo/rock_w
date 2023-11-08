import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rock_w/features/weather_forecast/entity/forecast_entity.dart';
import 'package:rock_w/features/weather_forecast/presenter/forecast_state.dart';
import 'package:rock_w/features/weather_forecast/interactor/service/forecast_service.dart';

class ForecastPresenter extends Cubit<ForecastState> {
  ForecastPresenter() : super(ForecastInitialState());

  Future<void> weatherForecastForNDays(double lon, double lat) async {
    emit(ForecastLoadingState());
    try {
      ForecastEntity result =
          await GetIt.I.get<WeatherForecastService>().get(lon, lat);
      emit(ForecastLoadedState(result));
    } catch (e) {
      emit(ForecastErrorState(e.toString()));
      log(e.toString());
    }
  }
}
