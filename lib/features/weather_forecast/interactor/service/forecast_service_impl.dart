import 'dart:developer';
import 'package:get_it/get_it.dart';
import 'package:rock_w/core/env/config_env.dart';
import 'package:rock_w/core/http/app_cache_interceptor.dart';
import 'package:rock_w/core/http/app_http.dart';
import 'package:rock_w/core/logger/app_logger.dart';
import 'package:rock_w/features/weather_forecast/entity/forecast_entity.dart';
import 'package:rock_w/features/weather_forecast/interactor/dto/forecast_dto.dart';
import 'package:rock_w/features/weather_forecast/interactor/service/forecast_service.dart';

class WeatherForecastServiceImpl extends WeatherForecastService {
  @override
  Future<ForecastEntity> get(double lon, double lat) async {
    try {
      final appHttp = GetIt.I.get<AppHttp>();
      appHttp.addInterceptor(GetIt.I.get<AppCacheInterceptor>());
      final response = await appHttp.get(
          '${EnvironmentConfig.apiPath}forecast?lat=$lat&lon=$lon&appid=${EnvironmentConfig.apiToken}');
      ForecastEntity result = ForecastDto.fromJson(response.data).toEntity();
      return result;
    } on Exception catch (e, s) {
      log(e.toString());
      AppLogger.instance.logError('Error in WeatherForecastService GET',
          exception: e, stackTrace: s);
      rethrow;
    }
  }
}
