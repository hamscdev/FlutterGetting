import 'dart:convert';
import 'package:flutterprojects/data/models/weather_model.dart';
import 'package:http/http.dart' as http;


class HttpHelper {



 final String baseUrl = 'api.weatherapi.com';
 final String path = 'v1/current.json';
 final  String apiKeys = '20ac715482fd4db698c233108240802';
 final String lang = 'es';


   Future<WeatherModel> getWeather(String location) async {
     Map<String, dynamic> parameters = {'q' : location, 'key': apiKeys, 'lang' : lang};
     Uri uri = Uri.http(baseUrl,path, parameters);
     http.Response  result = await http.get(uri);
     return WeatherModel.fromJson(jsonDecode(result.body));
   }



}
