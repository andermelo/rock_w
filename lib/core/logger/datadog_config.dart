import 'package:datadog_flutter_plugin/datadog_flutter_plugin.dart';
import 'package:rock_w/core/env/config_env.dart';

final configuration = DatadogConfiguration(
  clientToken: EnvironmentConfig.dataDogToken,
  env: EnvironmentConfig.dataDogEnv,
  site: DatadogSite.us3,
  nativeCrashReportEnabled: true,
  loggingConfiguration: DatadogLoggingConfiguration(),
  rumConfiguration: DatadogRumConfiguration(
    applicationId: EnvironmentConfig.dataDogAppId,
  ),
);
