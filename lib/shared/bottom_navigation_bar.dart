import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class MyBottonNavigationBar extends StatefulWidget {
const MyBottonNavigationBar({Key? key}) : super(key: key);
@override
State<MyBottonNavigationBar> createState() => _MyBottonNavigationBar();
}



class _MyBottonNavigationBar extends State<MyBottonNavigationBar>{
  int _selectedIndex = 0;
    @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.scale_rounded), label: 'BMI'),
      BottomNavigationBarItem(icon: BoxedIcon(WeatherIcons.day_cloudy_gusts), label: 'Weather'),
      BottomNavigationBarItem(icon: Icon(Icons.on_device_training_outlined), label: 'Training')
    ], 
    currentIndex: _selectedIndex,
    onTap: (int index){
      if (index == 0) {
        Navigator.pushNamed(context, '/');
      } else if (index == 1) {
        Navigator.pushNamed(context, '/bmi');
      } else if (index == 2) {
        Navigator.pushNamed(context, '/weather');
      } else if (index == 3) {
        Navigator.pushNamed(context, '/training');
      }
      setState(() {
        _selectedIndex = index;
      });
    }, 
    elevation: 0,
    backgroundColor: Colors.white10,
    selectedItemColor: const Color.fromARGB(255, 34, 40, 157));
  }


}

