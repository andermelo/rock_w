import 'dart:developer';
import 'package:get_it/get_it.dart';
import 'package:rock_w/core/api/api_const.dart';
import 'package:rock_w/core/http/app_http.dart';
import 'package:rock_w/features/weather_forecast/entity/forecast_entity.dart';
import 'package:rock_w/features/weather_forecast/interactor/dto/forecast_dto.dart';
import 'package:rock_w/features/weather_forecast/interactor/service/forecast_service.dart';

class WeatherForecastServiceImpl extends WeatherForecastService {
  @override
  Future<ForecastEntity> get(double lon, double lat) async {
    try {
      final appHttp = GetIt.I.get<AppHttp>();
      final response = await appHttp
          .get('${apiUrl}forecast?lat=$lat&lon=$lon&appid=$apiKey');
      ForecastEntity result = ForecastDto.fromJson(response.data).toEntity();
      return result;
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}
