import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                  primarySwatch: getThemeColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.condition)),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) return Colors.blue;
  switch (condition) {
    case "Clear":
      return Colors.amber;
    case "Rain":
      return Colors.blueGrey;
    case "Snow":
      return Colors.lightBlue;
    case "Clouds":
      return Colors.grey;
    case "Thunderstorm":
      return Colors.deepPurple;
    case "Drizzle":
      return Colors.blue;
    case "Fog":
      return Colors.blueGrey;
    case "Windy":
      return Colors.lightGreen;
    case "Hail":
      return Colors.lightBlue;
    default:
      return Colors.blue; // Default color if condition doesn't match
  }
}
