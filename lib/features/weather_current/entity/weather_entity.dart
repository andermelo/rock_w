import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final String id;
  final Map<String, double> coord;
  final String name;
  final String main;
  final String descriptiton;
  final double temp;
  final double tempMin;
  final double tempMax;
  final String date;

  const WeatherEntity({
    required this.id,
    required this.coord,
    required this.name,
    required this.main,
    required this.descriptiton,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.date,
  });

  @override
  List<Object?> get props =>
      [id, coord, main, descriptiton, temp, tempMin, tempMax, date];
}
