import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rock_w/core/style/colors.dart';
import 'package:rock_w/core/util/date_extension.dart';
import 'package:rock_w/core/util/temperature_extension.dart';
import 'package:rock_w/features/weather_current/presenter/current_presenter.dart';
import 'package:rock_w/features/weather_current/presenter/current_state.dart';
import 'package:rock_w/features/weather_forecast/view/weather_forecast_view.dart';

class WeatherCurrentView extends StatefulWidget {
  const WeatherCurrentView({super.key});
  static const String routeName = 'home';

  @override
  State<WeatherCurrentView> createState() => _WeatherCurrentViewState();
}

class _WeatherCurrentViewState extends State<WeatherCurrentView> {
  CurrentPresenter currentPresenter = CurrentPresenter();

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
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => currentPresenter..doWeatherCurrentWithCities(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.skyBlue,
          body: BlocConsumer<CurrentPresenter, CurrentState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is CurrentLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              }
              if (state is CurrentLoadedState) {
                return Column(
                  children: [
                    const Text('Search field here'),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.weatherCurrentCities.length,
                        itemBuilder: (context, index) {
                          var item = state.weatherCurrentCities[index];
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
                                                  "now",
                                                  style: textTheme.displaySmall,
                                                ),
                                                Text(
                                                    item.temp
                                                        .toCelsiusFromKelvinString(),
                                                    style:
                                                        textTheme.displayLarge),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(item.name.toUpperCase(),
                                                    style:
                                                        textTheme.titleLarge),
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
                                          padding:
                                              const EdgeInsets.only(left: 9.0),
                                          child: RotatedBox(
                                            quarterTurns: -1,
                                            child: Text(
                                                item.date.getFormattedDate(),
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
                      ),
                    ),
                  ],
                );
              }
              if (state is CurrentErrorState) {
                /// TODO: Implement enhanced exception handling. In the future, we need to add
                /// specific logic to determine whether exceptions are due to connectivity issues
                /// or other types of network failures. This will allow for more accurate error
                /// responses and improve the app's resilience and user experience.
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
