import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseURL = "https://api.openweathermap.org/data/2.5";
  final String apiKey = "9cb5919da277a2ac1804b21bb8428e50";
  WeatherService(this.dio);
  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response =
          await dio.get("$baseURL/weather?q=$cityName&APPID=$apiKey");
      WeatherModel myModel = WeatherModel.fromJson(response.data);
      return myModel;
    } on DioException catch (e) {
      final String error =
          e.response?.data["error"]["message"] ?? "Sorry, There is a problem";
      throw Exception(error);
    } catch (e) {
      log("Ops");
      throw Exception("Ops, There is a problem");
    }
  }
}
