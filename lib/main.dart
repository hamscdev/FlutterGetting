import 'package:flutter/material.dart';
import 'package:flutterprojects/screens/bmi_screen.dart';
import 'package:flutterprojects/screens/intro_screen.dart';
import 'package:flutterprojects/screens/session_screen.dart';
import 'package:flutterprojects/screens/weather_screen.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) =>  IntroScreen(),
        '/bmi' : (context) =>  BmiScreen(),
        '/weather' : (context) =>  WeatherScreen(),
        '/training' : (context) =>  SessionScreen()
      },
      initialRoute: '/',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
