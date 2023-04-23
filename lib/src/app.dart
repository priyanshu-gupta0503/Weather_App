import 'package:flutter/material.dart';
import 'package:weather/src/pages/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "WEATHER APP",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
