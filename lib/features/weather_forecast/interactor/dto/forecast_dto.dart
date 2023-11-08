import 'package:intl/intl.dart';
import 'package:rock_w/features/weather_current/entity/weather_entity.dart';
import 'package:rock_w/features/weather_current/interactor/dto/weather_dto.dart';
import 'package:rock_w/features/weather_forecast/entity/forecast_entity.dart';

class ForecastDto {
  final String cityId;
  final String name;
  final String country;
  List<WeatherDto> forecast;
  final String consultedAt;

  ForecastDto({
    required this.cityId,
    required this.name,
    required this.country,
    required this.forecast,
    required this.consultedAt,
  });

  void filterForecastByUniqueDate() {
    var now = DateTime.now();
    var nextDay = DateTime(now.year, now.month, now.day);

    var uniqueDates = <String>{};
    var filteredList = <WeatherDto>[];

    for (var weatherDto in forecast) {
      var date = DateTime.fromMillisecondsSinceEpoch(weatherDto.dt * 1000);

      if (date.isBefore(nextDay)) continue;

      var dateString = DateFormat('yyyy-MM-dd').format(date);

      if (uniqueDates.add(dateString) && uniqueDates.length <= 5) {
        filteredList.add(weatherDto);
      }

      if (uniqueDates.length == 5) break;
    }

    forecast = filteredList;
  }

  factory ForecastDto.fromJson(json) {
    var list = (json['list'] as List)
        .map((item) => WeatherDto.fromJson(item))
        .toList();

    var forecastDto = ForecastDto(
      cityId: json['city']['id'].toString(),
      name: json['city']['name'],
      country: json['city']['country'],
      forecast: list,
      consultedAt: DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now()),
    );

    forecastDto.filterForecastByUniqueDate();

    return forecastDto;
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
