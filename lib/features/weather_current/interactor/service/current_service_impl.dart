import 'dart:developer';
import 'package:get_it/get_it.dart';
import 'package:rock_w/core/env/config_env.dart';
import 'package:rock_w/core/http/app_cache_interceptor.dart';
import 'package:rock_w/core/http/app_http.dart';
import 'package:rock_w/core/logger/app_logger.dart';
import 'package:rock_w/features/weather_current/entity/weather_entity.dart';
import 'package:rock_w/features/weather_current/interactor/dto/weather_dto.dart';
import 'package:rock_w/features/weather_current/interactor/service/current_service.dart';

class WeatherCurrentServiceImpl extends WeatherCurrentService {
  @override
  Future<WeatherEntity> get(double lon, double lat) async {
    try {
      final appHttp = GetIt.I.get<AppHttp>();
      appHttp.addInterceptor(GetIt.I.get<AppCacheInterceptor>());
      final response = await appHttp.get(
          '${EnvironmentConfig.apiPath}weather?lat=$lat&lon=$lon&appid=${EnvironmentConfig.apiToken}');
      WeatherEntity result = WeatherDto.fromJson(response.data).toEntity();
      return result;
    } on Exception catch (e, s) {
      log(e.toString());
      AppLogger.instance.logError('Error in WeatherCurrentService GET',
          exception: e, stackTrace: s);
      rethrow;
    }
  }
}
