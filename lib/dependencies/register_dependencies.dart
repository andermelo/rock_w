import 'package:get_it/get_it.dart';
import 'package:rock_w/core/http/app_http.dart';
import 'package:rock_w/core/http/app_http_impl.dart';
import 'package:rock_w/features/weather_current/interactor/service/current_service.dart';
import 'package:rock_w/features/weather_current/interactor/service/current_service_impl.dart';

class RegisterDependencies {
  static on(GetIt getIt) {
    /// HTTP DIO INJECTOR
    ///
    ///
    getIt.registerLazySingleton<AppHttp>(() => AppHttpImpl());

    /// SERVICES
    ///
    ///
    getIt.registerLazySingleton<WeatherCurrentService>(
        () => WeatherCurrentServiceImpl());
  }
}
