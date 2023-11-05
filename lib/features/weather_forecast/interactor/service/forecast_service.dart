import 'package:rock_w/features/weather_forecast/entity/forecast_entity.dart';

abstract class WeatherForecastService {
  Future<ForecastEntity> get(double lon, double lat);
}
