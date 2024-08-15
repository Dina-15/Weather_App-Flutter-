class WeatherModel {
  final String cityName;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String condition;

  WeatherModel(
      {required this.cityName,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.condition});
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        cityName: json['name'],
        temp: json["main"]["temp"],
        maxTemp: json["main"]["temp_max"],
        minTemp: json["main"]["temp_min"],
        condition: json["weather"][0]["main"]);
  }
}
