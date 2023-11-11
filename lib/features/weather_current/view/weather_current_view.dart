import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rock_w/core/logger/app_logger.dart';
import 'package:rock_w/core/style/colors.dart';
import 'package:rock_w/features/weather_current/presenter/current_presenter.dart';
import 'package:rock_w/features/weather_current/presenter/current_state.dart';
import 'package:rock_w/features/weather_current/view/widget/current_list_item_widget.dart';
import 'package:rock_w/features/weather_current/view/widget/filter_search_input_widget.dart';

class WeatherCurrentView extends StatefulWidget {
  const WeatherCurrentView({super.key});
  static const String routeName = 'home';

  @override
  State<WeatherCurrentView> createState() => _WeatherCurrentViewState();
}

class _WeatherCurrentViewState extends State<WeatherCurrentView> {
  CurrentPresenter currentPresenter = CurrentPresenter();

  @override
  void initState() {
    AppLogger.instance.addUser({
      'name': 'Anderson Melo',
      'email': 'email@email.com',
      'id': 'gdyasd2943hwjdhsad324edasdasd'
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => currentPresenter..doWeatherCurrentWithCities(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.skyBlue,
          body: Column(
            children: [
              FilterSearchInputWidget(presenter: currentPresenter),
              BlocConsumer<CurrentPresenter, CurrentState>(
                listener: (context, state) {},
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case CurrentLoadingState:
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    case CurrentLoadedState:
                      return Expanded(
                        child: CurrentListItemWidget(
                            weatherList: (state as CurrentLoadedState)
                                .weatherCurrentCities),
                      );
                    case CurrentFilteredState:
                      return Expanded(
                        child: CurrentListItemWidget(
                          weatherList: [
                            (state as CurrentFilteredState).weather
                          ],
                        ),
                      );
                    case CurrentNoResultState:
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          (state as CurrentNoResultState).message,
                          style: textTheme.displayMedium,
                          textAlign: TextAlign.center,
                        ),
                      );
                    case CurrentErrorState:

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
                    default:
                      return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
