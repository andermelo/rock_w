extension Temperature on double {
  String toCelsiusFromKelvinString() {
    double celsius = this - 273.15;
    return "${celsius.toStringAsFixed(1)}°C";
  }
}
