import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rock_w/core/route/app_routes.dart';
import 'package:rock_w/core/style/theme.dart';
import 'package:rock_w/dependencies/register_dependencies.dart';
import 'package:rock_w/features/weather_current/view/weather_current_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt getIt = GetIt.instance;
  await RegisterDependencies.on(getIt);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RockW',
      initialRoute: WeatherCurrentView.routeName,
      routes: AppRoutes.routes,
      navigatorObservers: [
        DatadogNavigationObserver(datadogSdk: DatadogSdk.instance),
      ],
      theme: ThemeData.light(useMaterial3: true).copyWith(
        textTheme: AppStyleTheme().textTheme,
      ),
    );
  }
}
