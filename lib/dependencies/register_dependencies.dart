import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rock_w/core/database/app_database.dart';
import 'package:rock_w/core/database/app_database_impl.dart';
import 'package:rock_w/core/http/app_cache_interceptor.dart';
import 'package:rock_w/core/http/app_http.dart';
import 'package:rock_w/core/http/app_http_impl.dart';
import 'package:rock_w/features/weather_current/interactor/service/current_service.dart';
import 'package:rock_w/features/weather_current/interactor/service/current_service_impl.dart';
import 'package:rock_w/features/weather_forecast/interactor/service/forecast_service.dart';
import 'package:rock_w/features/weather_forecast/interactor/service/forecast_service_impl.dart';

class RegisterDependencies {
  static Future<void> on(GetIt getIt) async {
    // DB HIVE
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    var box = await Hive.openBox('appBox');
    AppDatabaseImpl appDatabaseImpl = AppDatabaseImpl(box: box);
    await appDatabaseImpl.init();
    getIt.registerSingleton<AppDatabase>(appDatabaseImpl);

    // HTTP DIO INJECTOR
    getIt.registerLazySingleton<AppHttp>(() => AppHttpImpl());
    getIt.registerSingleton<Connectivity>(Connectivity());
    getIt.registerSingleton<AppCacheInterceptor>(AppCacheInterceptor(
      appDatabase: getIt(),
      connectivity: getIt(),
    ));

    // SERVICES
    getIt.registerLazySingleton<WeatherCurrentService>(
        () => WeatherCurrentServiceImpl());
    getIt.registerLazySingleton<WeatherForecastService>(
        () => WeatherForecastServiceImpl());
  }
}
