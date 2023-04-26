// ignore_for_file: unused_element, duplicate_import, unused_import, unused_local_variable, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:weather/src/pages/splash.dart';
import '../model/weather_model.dart';
import 'package:http/http.dart' as https;
import 'dart:convert';
// ignore: duplicate_import
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as https;
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/src/icons/icon.dart';
import 'dart:async';
import 'package:weather/src/services/weather_app.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool loading = true;
  late Weather weatherinfo;
  getWeatherInfo({String city = "bhubaneswar"}) async {
    try {
      var response = await https.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=e6d9846ba2796805199d85e505103ccb&units=metric"));

      var decoded = await jsonDecode(response.body);
      weatherinfo = Weather(
          cityName: decoded["name"],
          temp: decoded["main"]["temp"],
          date: decoded["dt"],
          description: decoded["weather"][0]["description"],
          pressure: decoded["main"]["pressure"],
          wind: decoded["wind"]["speed"],
          sunrise: decoded["sys"]["sunrise"],
          humidity: decoded["main"]["humidity"],
          sunset: decoded["sys"]["sunset"],
          visibility: decoded["visibility"]);

      // weatherinfo = Weather(temp: decoded["main"][0]["temp"]);
      // weatherinfo = Weather(wind: decoded["wind"][0]["speed"]);
      // weatherinfo = Weather(humidity: decoded["main"][0]["humidity"]);
      // weatherinfo = Weather(pressure: decoded["name"]);
      // weatherinfo = Weather(visibility: decoded["visibility"]);
      // weatherinfo = Weather(description: decoded["weather"][0]["description"]);
      // weatherinfo = Weather(sunrise: decoded["sys"][0]["sunrise"]);
      // weatherinfo = Weather(sunset: decoded["sys"][0]["sunset"]);
      // weatherinfo = Weather(date: decoded["dt"]);
      // print(weatherinfo.cityName);
      setState(() {
        loading = false;
      });
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  // WeatherAppClient client = WeatherAppClient();
  @override
  void initState() {
    getWeatherInfo();
    super.initState();
    // client.getCurrentweather("cuttack");
  }

  @override
  Widget build(BuildContext context) {
    const sizedBox = SizedBox(
      height: 8,
    );
    int? unixTimestamp = weatherinfo
        .date; // Replace with the actual timestamp from the weather API response
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(unixTimestamp! *
        1000); // Multiplying by 1000 to convert seconds to milliseconds
    String formattedTime = dateTime.toString();
    int? unixTimestamp1 = weatherinfo
        .sunrise; // Replace with the actual timestamp from the weather API response
    DateTime dateTime1 = DateTime.fromMillisecondsSinceEpoch(unixTimestamp1! *
        1000); // Multiplying by 1000 to convert seconds to milliseconds
    int hour1 = dateTime1.hour; // Hour (0-23)
    int minute1 = dateTime1.minute; // Minute (0-59)
    int second1 = dateTime1.second;
    int? unixTimestamp2 = weatherinfo
        .sunset; // Replace with the actual timestamp from the weather API response
    DateTime dateTime2 = DateTime.fromMillisecondsSinceEpoch(unixTimestamp2! *
        1000); // Multiplying by 1000 to convert seconds to milliseconds
    int hour2 = dateTime2.hour; // Hour (0-23)
    int minute2 = dateTime2.minute; // Minute (0-59)
    int second2 = dateTime2
        .second; // Converting DateTime object to a string representation
    // Printing the formatted time

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 239, 242),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 5, 85, 151),
          title: const Text("Weather by city"),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.search_outlined),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchPage()));
                // ignore: avoid_print
                // showSearch(context: context, delegate: customsearch());
              },
            )
          ],
          leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        ),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              height: 1000,
              width: 1000,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'images/nick-fewings-XXBgxhS_-vc-unsplash.jpg'),
                      fit: BoxFit.cover)),
              child: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: SingleChildScrollView(
                  child: Column(children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 30,
                      width: 600,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 99, 231, 248),
                          border: Border.all(
                              width: 5,
                              color: const Color.fromARGB(255, 72, 136, 255)),
                          borderRadius: BorderRadius.circular(50)),
                      child: Column(
                        children: [
                          Text(
                            formattedTime,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 200.0,
                    ),
                    Align(
                        alignment: FractionalOffset.centerLeft,
                        child: Text(
                          // ignore: prefer_interpolation_to_compose_strings
                          weatherinfo.temp!.toString() + "\u2103",
                          style: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 96, 194, 233),
                          ),
                        )),
                    const SizedBox(
                      height: 0.5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        weatherinfo.description.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 41, 43, 45)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 1,
                        ),
                        Container(
                            height: 110,
                            width: 110,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 176, 213, 241)
                                    .withOpacity(0.8),
                                borderRadius: BorderRadius.circular(30)),
                            margin: const EdgeInsets.only(right: 5.0),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsetsDirectional.all(9.0),
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Icon(
                                      Myicons.gauge,
                                      color: Color.fromARGB(255, 124, 15, 213),
                                      size: 38,
                                    ),
                                  ),
                                ),
                                const Text(
                                  "Pressure",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                      weatherinfo.pressure.toString() + " Pa",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w200,
                                          fontSize: 15)),
                                )
                              ],
                            )),
                        Container(
                            height: 110,
                            width: 110,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 176, 213, 241)
                                    .withOpacity(0.8),
                                borderRadius: BorderRadius.circular(30)),
                            margin: const EdgeInsets.only(right: 5.0),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsetsDirectional.all(9.0),
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Icon(
                                      Myicons.day_cloud_wind_icon,
                                      color: Color.fromARGB(255, 35, 8, 237),
                                      size: 38,
                                    ),
                                  ),
                                ),
                                const Text(
                                  "Wind speed",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                      weatherinfo.wind.toString() + " m/s ",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w200,
                                          fontSize: 15)),
                                )
                              ],
                            )),
                        Container(
                            height: 110,
                            width: 110,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 176, 213, 241)
                                    .withOpacity(0.8),
                                borderRadius: BorderRadius.circular(30)),
                            margin: const EdgeInsets.only(right: 5.0),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsetsDirectional.all(9.0),
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Icon(
                                      Myicons.sunrise_icon,
                                      color: Color.fromARGB(255, 213, 160, 15),
                                      size: 38,
                                    ),
                                  ),
                                ),
                                const Text(
                                  "Sunrise",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                      hour1.toString() +
                                          ":" +
                                          minute1.toString() +
                                          ":" +
                                          second1.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w200,
                                          fontSize: 15)),
                                )
                              ],
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 1,
                        ),
                        Container(
                            height: 110,
                            width: 110,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 176, 213, 241)
                                    .withOpacity(0.8),
                                borderRadius: BorderRadius.circular(30)),
                            margin: const EdgeInsets.only(right: 5.0),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsetsDirectional.all(9.0),
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Icon(
                                      Myicons.drop_humidity_icon,
                                      color: Color.fromARGB(255, 54, 106, 196),
                                      size: 38,
                                    ),
                                  ),
                                ),
                                const Text(
                                  "Humidity",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                      weatherinfo.humidity.toString() + " %",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w200,
                                          fontSize: 15)),
                                )
                              ],
                            )),
                        Container(
                            height: 110,
                            width: 110,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 176, 213, 241)
                                    .withOpacity(0.8),
                                borderRadius: BorderRadius.circular(30)),
                            margin: const EdgeInsets.only(right: 5.0),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsetsDirectional.all(9.0),
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Icon(
                                      Myicons.low_vision_icon,
                                      color: Color.fromARGB(255, 202, 38, 156),
                                      size: 38,
                                    ),
                                  ),
                                ),
                                const Text(
                                  "Visibility",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                      weatherinfo.visibility.toString() + " m ",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w200,
                                          fontSize: 15)),
                                )
                              ],
                            )),
                        Container(
                            height: 110,
                            width: 110,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 176, 213, 241)
                                    .withOpacity(0.8),
                                borderRadius: BorderRadius.circular(30)),
                            margin: const EdgeInsets.only(right: 5.0),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsetsDirectional.all(9.0),
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Icon(
                                      Myicons.sunset,
                                      color: Color.fromARGB(255, 193, 101, 16),
                                      size: 38,
                                    ),
                                  ),
                                ),
                                const Text(
                                  "Sunset",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                      hour2.toString() +
                                          ":" +
                                          minute2.toString() +
                                          ":" +
                                          second2.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w200,
                                          fontSize: 15)),
                                )
                              ],
                            )),
                      ],
                    )
                  ]),
                ),
              )),
            ),
    );
  }
}

class CustomSearch extends SearchDelegate {
  List<String> allData = [
    'Cuttack',
    'Bhubaneswar',
    'Kendrapara',
    'Delhi',
    'Varanasi'
  ];

  dynamic getWeatherInfo;

  CustomSearch(this.getWeatherInfo);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }

    if (matchQuery.isEmpty) {
      matchQuery.add(query);
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
            onTap: () {
              getWeatherInfo(city: result.toString());
              close(context, null); // it used to close the context.
            },
          );
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = ["#@"];
    for (var item in allData) {
      if (item.toLowerCase().contains(
            query.toLowerCase(),
          )) {
        matchQuery.add(item);
      } else {
        matchQuery[0] = query;
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(query),
          onTap: () {
            getWeatherInfo(
              city: query.toString(),
            );

            close(context, null);
          },
        );
      },
    );
  }
}
