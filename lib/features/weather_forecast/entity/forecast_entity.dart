import 'package:equatable/equatable.dart';
import 'package:rock_w/features/weather_current/entity/weather_entity.dart';

class ForecastEntity extends Equatable {
  /// [cityId] Unique identifier for the city, typically a numeric or alphanumeric string.
  final String cityId;

  /// [name] The name of the city for which the forecast is provided.
  final String name;

  /// [country] The ISO country code representing the country of the city.
  final String country;

  /// [forecast] A list of `WeatherEntity` objects, each representing the weather forecast
  /// at a specific date and time for the city.
  final List<WeatherEntity> forecast;

  /// [consultedAt] A string representation of the timestamp when the forecast data was
  /// last retrieved or consulted. This can be used to determine the freshness of the data.
  final String consultedAt;

  const ForecastEntity({
    required this.cityId,
    required this.name,
    required this.country,
    required this.forecast,
    required this.consultedAt,
  });

  @override
  List<Object?> get props => [cityId, name, country, forecast, consultedAt];
}
