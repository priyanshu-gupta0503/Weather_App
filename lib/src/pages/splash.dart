// ignore_for_file: unused_import, unused_local_variable, unnecessary_const

import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as https;
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/src/icons/icon.dart';
import 'dart:async';
import 'package:weather/src/services/weather_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  WeatherAppClient client = WeatherAppClient();
  @override
  void initState() {
    super.initState();
    client.getCurrentweather("Georgia");
  }

  @override
  Widget build(BuildContext context) {
    const sizedBox = const SizedBox(
      height: 8,
    );
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 239, 242),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 5, 85, 151),
          title: const Text('Iter,Bhubaneshwar'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.location_pin),
              onPressed: () {},
            )
          ],
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ),
      ),
      body: Container(
        height: 1000,
        width: 1000,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image:
                    AssetImage('images/nick-fewings-XXBgxhS_-vc-unsplash.jpg'),
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
                  children: const [
                    Text(
                      'Fri,21 April,2023',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 200.0,
              ),
              const Align(
                  alignment: FractionalOffset.centerLeft,
                  child: Text(
                    '52\u2103',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 96, 194, 233),
                    ),
                  )),
              const SizedBox(
                height: 0.5,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '  broken clouds',
                  style: TextStyle(
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
                        children: const [
                          Padding(
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
                          Text(
                            "Pressure",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 12),
                          ),
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
                        children: const [
                          Padding(
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
                          Text(
                            "Wind",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 12),
                          ),
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
                        children: const [
                          Padding(
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
                          Text(
                            "Sunrise",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 12),
                          ),
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
                        children: const [
                          Padding(
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
                          Text(
                            "Humidity",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 12),
                          ),
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
                        children: const [
                          Padding(
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
                          Text(
                            "Visibility",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 12),
                          ),
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
                        children: const [
                          Padding(
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
                          Text(
                            "Sunset",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 12),
                          ),
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
