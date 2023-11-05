import 'package:rock_w/features/weather_current/entity/weather_entity.dart';

abstract class WeatherCurrentService {
  Future<WeatherEntity?> get(double lon, double lat);
}
