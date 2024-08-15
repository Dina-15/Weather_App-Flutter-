import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
      color: const Color.fromARGB(255, 231, 154, 170),
      child: Column(
        children: [
          Image.asset('assets/rain-9315_256.gif', width: double.infinity,height: 250,),
          const SizedBox(
            height: 100,
          ),
          const Text(
            "There is no Weather 🌍",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              color: Color.fromARGB(255, 153, 63, 116),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Start Searching Now 🔍",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              color: Color.fromARGB(255, 153, 63, 116),
            ),
          ),
        ],
      ),
    );
  }
}

/* 
  Cubit pattern steps ..
    # create states
    # create cubit
    # create funcyion
    # provide cubit
    # integrate cubit
    # trigger cubit
*/