import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class initialState extends WeatherState {}

class LoadedWeatherState extends WeatherState {
  final WeatherModel weatherModel;

  LoadedWeatherState({required this.weatherModel});
}

class FailurLoadWeatherState extends WeatherState {}
