import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rock_w/features/weather_current/entity/weather_entity.dart';
import 'package:rock_w/features/weather_current/interactor/service/current_service.dart';
import 'package:rock_w/features/weather_current/presenter/current_state.dart';

class CurrentPresenter extends Cubit<CurrentState> {
  CurrentPresenter() : super(CurrentInitialState());

  Future<Map<String, dynamic>> _loadJson() async {
    try {
      String jsonString =
          await rootBundle.loadString('assets/json/list_city.json');
      Map<String, dynamic> jsonResponse = jsonDecode(jsonString);
      return jsonResponse;
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }

  Future<void> doWeatherCurrentWithCities() async {
    emit(CurrentLoadingState());
    try {
      var jsonCities = await _loadJson();
      var listCities = jsonCities['cities'];
      List<WeatherEntity> resultCities = [];

      for (var cityName in listCities.keys) {
        var cityData = listCities[cityName];
        double lon = cityData['longitude'];
        double lat = cityData['latitude'];

        WeatherEntity weatherInfo =
            await GetIt.I.get<WeatherCurrentService>().get(lon, lat);
        resultCities.add(weatherInfo);
      }

      emit(CurrentLoadedState(resultCities));
    } catch (e) {
      emit(CurrentErrorState(e.toString()));
      log(e.toString());
    }
  }
}
