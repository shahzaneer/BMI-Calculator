import 'package:bmi_calculator/Constants/constants_.dart';
import 'package:bmi_calculator/Screens/input_.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: backgroundColor,
        scaffoldBackgroundColor: backgroundColor,
        accentColor: Colors.pink,
        sliderTheme: SliderTheme.of(context).copyWith(
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
          thumbColor: const Color.fromARGB(255, 233, 30, 99),
          overlayColor: const Color.fromARGB(29, 233, 30, 99),
          activeTrackColor: Colors.white,
          inactiveTrackColor: grey,
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
        ),
      ),
      home: const Input(),
    );
  }
}




// MAIN FILE -> 
// 1. to Set themes
// 2.  RunApp(Entry point widget to the APP);