import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Weather App",
            style: TextStyle(color: Colors.white, fontSize: 26),
          ),
          backgroundColor: /*Colors.black,*/Color.fromARGB(255, 155, 35, 85),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return SearchView();
                }));
              },
              icon: Icon(Icons.search),
              color: Colors.white,
              iconSize: 30,
            ),
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is initialState)
              return NoWeatherBody();
            else if (state is LoadedWeatherState)
              return WeatherInfoBody(myModel: state.weatherModel);
            else
              return const Text("Ops, Enter a valid City, Please !");
          },
        ),);
  }
}
