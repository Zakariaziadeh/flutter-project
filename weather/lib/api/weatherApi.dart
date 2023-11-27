import 'dart:convert';

import 'package:weather/api/weather.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  Future<Weather>? getCurrentWeather(String? location) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=3116f0a9f29c46ce134b312bc2b09603&units=metric");
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}
