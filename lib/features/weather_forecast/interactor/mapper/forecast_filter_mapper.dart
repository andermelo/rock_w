import 'package:intl/intl.dart';
import 'package:rock_w/features/weather_current/interactor/dto/weather_dto.dart';
import 'package:rock_w/features/weather_forecast/interactor/dto/forecast_dto.dart';

class ForecastFilterMapper {
  static ForecastDto filterByUniqueDate(ForecastDto forecast) {
    var now = DateTime.now();
    var nextDay = DateTime(now.year, now.month, now.day);

    ForecastDto finalForecast = forecast;

    var uniqueDates = <String>{};
    var filteredList = <WeatherDto>[];

    for (var weatherDto in forecast.forecast) {
      var date = DateTime.fromMillisecondsSinceEpoch(weatherDto.dt * 1000);

      if (date.isBefore(nextDay)) continue;

      var dateString = DateFormat('yyyy-MM-dd').format(date);

      if (uniqueDates.add(dateString) && uniqueDates.length <= 5) {
        filteredList.add(weatherDto);
      }

      if (uniqueDates.length == 5) break;
    }

    finalForecast.forecast = filteredList;

    return finalForecast;
  }
}
