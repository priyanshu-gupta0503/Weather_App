// ignore_for_file: unused_import, avoid_print

import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as https;
import 'package:weather/src/model/weather_model.dart';
import 'package:weather/src/pages/splash.dart';

class WeatherAppClient {
  Future<Weather>? getCurrentweather(String location) async {
    // ignore: unused_local_variable
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=e6d9846ba2796805199d85e505103ccb&units=metric");
    var response = await https.get(endpoint);
    var body = jsonDecode(response.body);

    print(Weather.fromJson(body).cityName);

    return Weather.fromJson(body);
  }
}
