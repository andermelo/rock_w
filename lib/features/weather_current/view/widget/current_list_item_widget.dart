import 'package:flutter/material.dart';
import 'package:rock_w/core/style/colors.dart';
import 'package:rock_w/core/util/date_extension.dart';
import 'package:rock_w/core/util/temperature_extension.dart';
import 'package:rock_w/features/weather_current/entity/weather_entity.dart';
import 'package:rock_w/features/weather_forecast/view/weather_forecast_view.dart';

class CurrentListItemWidget extends StatefulWidget {
  const CurrentListItemWidget({super.key, required this.weatherList});
  final List<WeatherEntity> weatherList;

  @override
  State<CurrentListItemWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CurrentListItemWidget> {
  Color getColor(int index) {
    switch (index) {
      case 0:
        return AppColors.skyBlue;
      case 1:
        return AppColors.cyan;
      case 2:
        return AppColors.ruddyBlue;
      case 3:
        return AppColors.argentinianBlue;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return ListView.builder(
      itemCount: widget.weatherList.length,
      itemBuilder: (context, index) {
        var item = widget.weatherList[index];
        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              WeatherForecastView.routeName,
              arguments: {
                "color": getColor(index),
                "lon": item.coord['lon'],
                "lat": item.coord['lat']
              },
            );
          },
          child: Container(
            color: getColor(index),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "now",
                                style: textTheme.displaySmall,
                              ),
                              Text(item.temp.toCelsiusFromKelvinString(),
                                  style: textTheme.displayLarge),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.name.toUpperCase(),
                                  style: textTheme.titleLarge),
                              Text(item.country.toUpperCase(),
                                  style: textTheme.titleLarge)
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 9.0),
                        child: RotatedBox(
                          quarterTurns: -1,
                          child: Text(item.date.getFormattedDate(),
                              style: textTheme.bodySmall),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
