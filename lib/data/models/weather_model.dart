class WeatherModel {
  Location? location;
  Current? current;

  WeatherModel({
     this.location,
     this.current,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        location: Location.fromJson(json['location']),
        current: Current.fromJson(json['current']));
  }
}

class Current {
  int lastUpdatedEpoch;
  String lastUpdated;
  double tempC;
  double tempF;
  int isDay;
  Condition condition;
  double windMph;
  double windKph;
  int windDegree;
  String windDir;
  double pressureMb;
  double pressureIn;
  double precipMm;
  double precipIn;
  int humidity;
  int cloud;
  double feelslikeC;
  double feelslikeF;
  double visKm;
  double visMiles;
  double uv;
  double gustMph;
  double gustKph;

  Current({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
  });

  factory Current.fromJson(Map<String, dynamic> json) {

    return Current(
        lastUpdatedEpoch: json['last_updated_epoch'] as int,
        lastUpdated: json['last_updated'] as String,
        tempC: json['temp_c'] as double,
        tempF: json['temp_f'] as double,
        isDay: json['is_day'] as int,
        condition: Condition.fromJson(json['condition']),
        windMph: json['wind_mph'] as double,
        windKph: json['wind_kph'] as double,
        windDegree: json['wind_degree'] as int,
        windDir: json['wind_dir'] as String,
        pressureMb: json['pressure_mb'] as double,
        pressureIn: json['pressure_in'] as double,
        precipMm: json['precip_mm'] as double,
        precipIn: json['precip_in'] as double,
        humidity: json['humidity'] as int,
        cloud: json['cloud'] as int,
        feelslikeC: json['feelslike_c'] as double,
        feelslikeF: json['feelslike_f'] as double,
        visKm: json['vis_km'] as double,
        visMiles: json['vis_miles'] as double,
        uv: json['uv'] as double,
        gustMph: json['gust_mph'] as double,
        gustKph: json['gust_kph'] as double);
  }
}

class Condition {
  String text;
  String icon;
  int code;

  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) {

    return Condition(
        text: json['text'] as String,
        icon: json['icon'] as String,
        code: json['code'] as int);
  }
}

class Location {
  String name;
  String region;
  String country;
  double lat;
  double lon;
  String tzId = '';
  int localtimeEpoch;
  String localtime;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
        name: json['name'] as String,
        region: json['region'] as String,
        country: json['country'] as String,
        lat: json['lat'] as double,
        lon: json['lon'] as double,
        tzId: json['tz_id'] as String,
        localtimeEpoch: json['localtime_epoch'] as int,
        localtime: json['localtime'] as String);
  }
}
