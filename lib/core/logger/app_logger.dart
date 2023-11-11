import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart' as datadog;
import 'package:datadog_tracking_http_client/datadog_tracking_http_client.dart';
import 'package:rock_w/core/env/config_env.dart';

class AppLogger {
  /// Singleton Pattern
  static final AppLogger _instance = AppLogger._();
  static AppLogger get instance => _instance;

  datadog.DatadogLogger? _logger;

  AppLogger._();

  void setLogger(datadog.DatadogLogger? logger) {
    _logger = logger;
  }

  Future<void> init() async {
    final configuration = datadog.DatadogConfiguration(
      clientToken: EnvironmentConfig.dataDogToken,
      env: EnvironmentConfig.dataDogEnv,
      site: datadog.DatadogSite.us3,
      nativeCrashReportEnabled: true,
      firstPartyHosts: ['api.openweathermap.org'],
      rumConfiguration: datadog.DatadogRumConfiguration(
          applicationId: EnvironmentConfig.dataDogAppId),
    )..enableHttpTracking();

    await datadog.DatadogSdk.instance
        .initialize(configuration, datadog.TrackingConsent.granted);

    _logger = datadog.DatadogSdk.instance.logs?.createLogger(
      datadog.DatadogLoggerConfiguration(
        service: "App Rock Server",
        name: "loggerAppFlutter",
        bundleWithRumEnabled: true,
        bundleWithTraceEnabled: true,
        networkInfoEnabled: true,
        remoteSampleRate: 100,
        customConsoleLogFunction:
            (level, message, service, name, stackTrace, attributes) {
          // ignore: avoid_print
          print("$level: $message");
        },
      ),
    );
  }

  void logInfo(String message) {
    _logger?.info(message);
  }

  void logWarning(String message) {
    _logger?.warn(message);
  }

  void logError(String message, {dynamic exception, StackTrace? stackTrace}) {
    _logger?.error(
      message,
      errorMessage: exception?.toString(),
      errorKind: exception?.runtimeType.toString(),
      errorStackTrace: stackTrace,
    );
    if (exception != null) {
      datadog.DatadogSdk.instance.rum?.addErrorInfo(
        message,
        datadog.RumErrorSource.source,
        stackTrace: stackTrace ?? StackTrace.fromString(message),
        attributes: {'exception': exception.toString()},
      );
    }
  }

  void addUser(Map<String, dynamic> user) {
    datadog.DatadogSdk.instance.setUserInfo(
      id: user['id'],
      name: user['name'],
      email: user['email'],
    );
  }
}
