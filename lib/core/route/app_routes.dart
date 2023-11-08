import 'package:flutter/material.dart';
import 'package:rock_w/features/weather_current/view/weather_current_view.dart';
import 'package:rock_w/features/weather_forecast/view/weather_forecast_view.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    WeatherCurrentView.routeName: ((context) => const WeatherCurrentView()),
    WeatherForecastView.routeName: ((context) => WeatherForecastView(
        args: ModalRoute.of(context)?.settings.arguments
            as Map<String, dynamic>)),
  };
}
