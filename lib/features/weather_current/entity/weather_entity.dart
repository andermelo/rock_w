import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  /// [id] City ID.
  final String id;

  /// [coord] Geographical coordinates (latitude/longitude).
  final Map<String, double> coord;

  /// [name] City name.
  final String name;

  /// [country] Country code (GB, JP etc.).
  final String country;

  /// [main] Group of weather parameters (Rain, Snow, Extreme etc.).
  final String main;

  /// [description] Weather condition within the group.
  final String description;

  /// [temp] Temperature. Unit: Kelvin.
  final double temp;

  /// [tempMin] Minimum temperature at the moment of calculation. Unit: Kelvin.
  final double tempMin;

  /// [tempMax] Maximum temperature at the moment of calculation. Unit: Kelvin.
  final double tempMax;

  /// [date] Time of data calculation, unix, UTC.
  final String date;

  const WeatherEntity({
    required this.id,
    required this.coord,
    required this.name,
    required this.country,
    required this.main,
    required this.description,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.date,
  });

  @override
  List<Object?> get props => [
        id,
        coord,
        name,
        country,
        main,
        description,
        temp,
        tempMin,
        tempMax,
        date
      ];
}
