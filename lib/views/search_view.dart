import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search a City",
          style: TextStyle(color: Colors.white, fontSize: 26),
        ),
        backgroundColor: Colors.black, //Color.fromARGB(255, 155, 35, 85),
      ),
      body: Column(children: [
        Image.asset("assets/sun_rain_cc.gif"),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onSubmitted: (value) async {
              var getWeather = BlocProvider.of<GetWeatherCubit>(context);
              getWeather.getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              hintText: "Enter City Name",
              suffixIcon: Icon(Icons.search),
              labelText: "Search",
              labelStyle: TextStyle(fontSize: 22),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 30, horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.blue),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
