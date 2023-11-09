/// Default values are for HOM environment
class EnvironmentConfig {
  static const apiToken = String.fromEnvironment('API_TOKEN',
      defaultValue: 'e56a12832cf8fb44e1ff9ec985bdd05b');
  static const apiPath = String.fromEnvironment('API_PATH',
      defaultValue: 'https://api.openweathermap.org/data/2.5/');
}
