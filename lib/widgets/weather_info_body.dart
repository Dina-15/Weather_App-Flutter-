import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.myModel});

final WeatherModel myModel;
  @override
  Widget build(BuildContext context) {
    
    // WeatherModel  =
    //     BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors:[
          getThemeColor(myModel.condition),
          getThemeColor(myModel.condition)[400]!,
          getThemeColor(myModel.condition)[200]!,
          getThemeColor(myModel.condition)[100]!,
          ],
        begin: Alignment.topCenter,
        end : Alignment.bottomCenter,
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            myModel.cityName,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Text(
            'Updated at ${DateTime.now().hour}:${DateTime.now().minute}',
            style: TextStyle(fontSize: 27),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "${myModel.temp.toString()}☀️",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (myModel.condition == "Clear")
                Image.asset(
                  'assets/clear.png',
                )
              else if (myModel.condition == "Clouds")
                Image.asset(
                  'assets/cloudy.png',
                )
              else if (myModel.condition == "Rain")
                Image.asset(
                  'assets/rainy.png',
                )
              else if (myModel.condition == "Snow")
                Image.asset(
                  'assets/snow.png',
                )
              else if (myModel.condition == "Thunder Storm")
                Image.asset(
                  'assets/thunderstorm.png',
                ),
              Column(
                children: [
                  Text(
                    "Max Temp  ${myModel.maxTemp.round()}🌡️",
                    style: TextStyle(fontSize: 28),
                  ),
                  Text(
                    "Min Temp  ${myModel.minTemp.round()}❄️",
                    style: TextStyle(fontSize: 28),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            myModel.condition,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
