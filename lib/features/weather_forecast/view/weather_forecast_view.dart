import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rock_w/core/util/date_extension.dart';
import 'package:rock_w/core/util/temperature_extension.dart';
import 'package:rock_w/features/weather_forecast/presenter/forecast_presenter.dart';
import 'package:rock_w/features/weather_forecast/presenter/forecast_state.dart';

class WeatherForecastView extends StatefulWidget {
  static const String routeName = 'forecast';
  const WeatherForecastView({super.key, required this.args});

  final Map<String, dynamic> args;

  @override
  State<WeatherForecastView> createState() => _WeatherForecastViewState();
}

class _WeatherForecastViewState extends State<WeatherForecastView> {
  ForecastPresenter forecastPresenter = ForecastPresenter();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => forecastPresenter
        ..weatherForecastForNDays(widget.args['lon'], widget.args['lat']),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: widget.args['color'],
          body: BlocConsumer<ForecastPresenter, ForecastState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is ForecastLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              }
              if (state is ForecastLoadedState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.forecastEntity.name.toUpperCase(),
                              style: textTheme.titleLarge),
                          Text(state.forecastEntity.country.toUpperCase(),
                              style: textTheme.titleLarge)
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.forecastEntity.forecast.length,
                        itemBuilder: (context, index) {
                          var item = state.forecastEntity.forecast[index];
                          return Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 1.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
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
                                Expanded(
                                  flex: 9,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.date.getWeekdayShort(),
                                            style: textTheme.displaySmall,
                                          ),
                                          Text(
                                              item.temp
                                                  .toCelsiusFromKelvinString(),
                                              style: textTheme.displayLarge),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
              if (state is ForecastErrorState) {
                return Center(
                  child: Text(
                    'NO \n CONNECTION',
                    style: textTheme.displayMedium,
                    textAlign: TextAlign.center,
                  ),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
