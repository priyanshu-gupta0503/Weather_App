// ignore_for_file: empty_constructor_bodies

class Weather {
  String? cityName;
  double? temp;
  double? wind;
  int? humidity;
  int? pressure;
  int? visibility;
  String? description;
  int? sunrise;
  int? sunset;
  Weather({
    this.cityName,
    this.temp,
    this.wind,
    this.humidity,
    this.pressure,
    this.visibility,
    this.description,
    this.sunrise,
    this.sunset,
  });
  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json["name"];
    temp = json["main"]["temp"];
    wind = json["wind"]["speed"];
    humidity = json["main"]["humidity"];
    pressure = json["main"]["pressure"];
    visibility = json["visibility"];
    description = json["weather"]["description"];
    sunrise = json["sys"]["sunrise"];
    sunset = json["sys"]["sunset"];
  }
}
