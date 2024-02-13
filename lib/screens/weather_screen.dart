import 'package:flutter/material.dart';
import 'package:flutterprojects/data/http_helper.dart';
import 'package:flutterprojects/data/models/weather_model.dart';
import 'package:weather_icons/weather_icons.dart';
import '../shared/bottom_navigation_bar.dart';
import '../shared/menu_drawer.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  _WeatherScreen createState() => _WeatherScreen();
}

class _WeatherScreen extends State<WeatherScreen> {
  final TextEditingController txtPlace = TextEditingController();

  WeatherModel resultWeather = WeatherModel(
      location: Location(
          name: '',
          region: '',
          country: '',
          lat: 0,
          lon: 0,
          tzId: '',
          localtimeEpoch: 0,
          localtime: ''),
      current: Current(
          lastUpdatedEpoch: 0,
          lastUpdated: '',
          tempC: 0,
          tempF: 0,
          isDay: 0,
          condition: Condition(text: '', icon: '', code: 0),
          windMph: 0,
          windKph: 0,
          windDegree: 0,
          windDir: '',
          pressureMb: 0,
          pressureIn: 0,
          precipMm: 0,
          precipIn: 0,
          humidity: 0,
          cloud: 0,
          feelslikeC: 0,
          feelslikeF: 0,
          visKm: 0,
          visMiles: 0,
          uv: 0,
          gustMph: 0,
          gustKph: 0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Weather')),
        drawer: const MenuDrawer(),
        bottomNavigationBar: const MyBottonNavigationBar(),
        body: Center(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: TextField(
              controller: txtPlace,
              decoration: InputDecoration(
                  hintText: 'Ingresa nombre de la ciudad',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search_outlined),
                    onPressed: getData ,
                  )),
            ),
          ),
          BoxedIcon(selectedIcon(resultWeather.current!.condition.text),
              size: 40),
          Text(
            resultWeather.current!.condition.text,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
          )
        ])));
  }

  IconData selectedIcon(String name) {
    switch (name) {
      case 'Soleado':
        return WeatherIcons.day_sunny;
      case 'Parcialmente nublado':
        return WeatherIcons.night_partly_cloudy;
      case 'Lluvia moderada a intervalos':
        return WeatherIcons.rain_mix;
      default:
        return WeatherIcons.night_alt_cloudy;
    }
  }

  Future getData() async {
    HttpHelper helper = HttpHelper();
    resultWeather = await helper.getWeather(txtPlace.text);
    setState(() {});
  }
}
