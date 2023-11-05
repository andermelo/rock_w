import 'package:intl/intl.dart';
import 'package:rock_w/features/weather_current/entity/weather_entity.dart';

class WeatherDto {
  final String id;
  final Map<String, double> coord;
  final String name;
  final String main;
  final String description;
  final double temp;
  final double tempMin;
  final double tempMax;
  final int dt;

  WeatherDto({
    required this.id,
    required this.coord,
    required this.name,
    required this.main,
    required this.description,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.dt,
  });

  factory WeatherDto.fromJson(Map<String, dynamic> json) {
    return WeatherDto(
      id: json['id'].toString(),
      coord: {
        'lon': json['coord']['lon'].toDouble(),
        'lat': json['coord']['lat'].toDouble(),
      },
      name: json['name'],
      main: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      temp: json['main']['temp'].toDouble(),
      tempMin: json['main']['temp_min'].toDouble(),
      tempMax: json['main']['temp_max'].toDouble(),
      dt: json['dt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': int.parse(id),
      'coord': coord,
      'name': name,
      'weather': [
        {
          'main': main,
          'description': description,
        },
      ],
      'main': {
        'temp': temp,
        'temp_min': tempMin,
        'temp_max': tempMax,
      },
      'dt': dt,
    };
  }

  WeatherEntity toEntity() {
    return WeatherEntity(
      id: id,
      coord: coord,
      name: name,
      main: main,
      descriptiton: description,
      temp: temp,
      tempMin: tempMin,
      tempMax: tempMax,
      date: DateFormat('yyyy-MM-dd – kk:mm')
          .format(DateTime.fromMillisecondsSinceEpoch(dt * 1000)),
    );
  }

  static WeatherDto fromEntity(WeatherEntity entity) {
    return WeatherDto(
      id: entity.id,
      coord: entity.coord,
      name: entity.name,
      main: entity.main,
      description: entity.descriptiton,
      temp: entity.temp,
      tempMin: entity.tempMin,
      tempMax: entity.tempMax,
      dt: (DateTime.parse(entity.date).millisecondsSinceEpoch ~/ 1000),
    );
  }
}
