import 'dart:developer';
import 'package:get_it/get_it.dart';
import 'package:rock_w/core/api/api_const.dart';
import 'package:rock_w/core/http/app_cache_interceptor.dart';
import 'package:rock_w/core/http/app_http.dart';
import 'package:rock_w/features/weather_current/entity/weather_entity.dart';
import 'package:rock_w/features/weather_current/interactor/dto/weather_dto.dart';
import 'package:rock_w/features/weather_current/interactor/service/current_service.dart';

class WeatherCurrentServiceImpl extends WeatherCurrentService {
  @override
  Future<WeatherEntity> get(double lon, double lat) async {
    try {
      final appHttp = GetIt.I.get<AppHttp>();
      appHttp.addInterceptor(GetIt.I.get<AppCacheInterceptor>());
      final response =
          await appHttp.get('${apiUrl}weather?lat=$lat&lon=$lon&appid=$apiKey');
      WeatherEntity result = WeatherDto.fromJson(response.data).toEntity();
      return result;
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}
