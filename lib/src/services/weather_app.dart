// // ignore_for_file: unused_import, avoid_print

// import 'dart:convert';
// import 'dart:math';

// import 'package:http/http.dart' as https;
// import 'package:weather/src/model/weather_model.dart';
// import 'package:weather/src/pages/splash.dart';

// class WeatherAppClient {
//   Future<Weather>? getCurrentweather(String location) async {
//     // print(location);
//     // ignore: unused_local_variable
//     var endpoint = Uri.parse(
//         "https://api.openweathermap.org/data/2.5/weather?q=cuttack&appid=e6d9846ba2796805199d85e505103ccb&units=metric");
//     var response = await https.get(endpoint);
//     var body = jsonDecode(response.body);

//     print("before printing line");
//     // print(body.name);

//     return Weather.fromJson(body);
//   }
// }
