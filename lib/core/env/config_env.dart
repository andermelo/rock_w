/// Default values are for HOM environment
class EnvironmentConfig {
  static const apiToken = String.fromEnvironment('API_TOKEN',
      defaultValue: 'e56a12832cf8fb44e1ff9ec985bdd05b');
  static const apiPath = String.fromEnvironment('API_PATH',
      defaultValue: 'https://api.openweathermap.org/data/2.5/');
  static const dataDogToken = String.fromEnvironment('DD_CLIENT_TOKEN',
      defaultValue: 'pub9b631cc8571e631078c1f6bec800fffc');
  static const dataDogEnv =
      String.fromEnvironment('DD_ENV', defaultValue: 'dev');
  static const dataDogAppId = String.fromEnvironment('DD_APP_ID',
      defaultValue: '3681e32d-c847-4af4-96df-8ea969db7631');
}
