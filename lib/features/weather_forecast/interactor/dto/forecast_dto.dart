import 'package:intl/intl.dart';
import 'package:rock_w/features/weather_current/entity/weather_entity.dart';
import 'package:rock_w/features/weather_current/interactor/dto/weather_dto.dart';
import 'package:rock_w/features/weather_forecast/entity/forecast_entity.dart';

class ForecastDto {
  final String cityId;
  final String name;
  final String country;
  final List<WeatherDto> forecast;
  final String consultedAt;

  ForecastDto({
    required this.cityId,
    required this.name,
    required this.country,
    required this.forecast,
    required this.consultedAt,
  });

  factory ForecastDto.fromJson(Map<String, dynamic> json) {
    var list = (json['list'] as List)
        .map((item) => WeatherDto.fromJson(item as Map<String, dynamic>))
        .toList();

    return ForecastDto(
      cityId: json['city']['id'].toString(),
      name: json['city']['name'],
      country: json['city']['country'],
      forecast: list,
      consultedAt: DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city': {
        'id': int.parse(cityId),
        'name': name,
        'country': country,
      },
      'list': forecast.map((weatherDto) => weatherDto.toJson()).toList(),
      'consultedAt': consultedAt,
    };
  }

  ForecastEntity toEntity() {
    List<WeatherEntity> weatherEntities =
        forecast.map((weatherDto) => weatherDto.toEntity()).toList();

    return ForecastEntity(
      cityId: cityId,
      name: name,
      country: country,
      forecast: weatherEntities,
      consultedAt: consultedAt,
    );
  }

  static ForecastDto fromEntity(ForecastEntity entity) {
    List<WeatherDto> forecastDto = entity.forecast
        .map((weatherEntity) => WeatherDto.fromEntity(weatherEntity))
        .toList();

    return ForecastDto(
      cityId: entity.cityId,
      name: entity.name,
      country: entity.country,
      forecast: forecastDto,
      consultedAt: entity.consultedAt,
    );
  }
}
