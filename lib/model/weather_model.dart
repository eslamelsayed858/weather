import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxtemp;
  double mintemp;
  String weatherStatrName;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxtemp,
    required this.mintemp,
    required this.weatherStatrName,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
        date: DateTime.parse(data['current']['last_updated']),
        temp: jsonData['avgtemp_c'],
        maxtemp: jsonData['maxtemp_f'],
        mintemp: jsonData['mintemp_f'],
        weatherStatrName: jsonData['condition']['text']);
  }

  @override
  String toString() {
    return 'date=$date tem=$temp maxTemp=$maxtemp minTemp=$mintemp ';
  }

  String getImage() {
    if (weatherStatrName == 'Clear' || weatherStatrName == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherStatrName == 'Sleet' ||
        weatherStatrName == 'Snow' ||
        weatherStatrName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherStatrName == 'Heavy Cioud') {
      return 'assets/images/cloudy.png';
    } else if (weatherStatrName == 'Light Rain' ||
        weatherStatrName == 'Heavy Rain' ||
        weatherStatrName == 'Moderate rain' ||
        weatherStatrName == 'Showers') {
      return 'assets/images/rainy.png';
    } else if (weatherStatrName == 'Thunderstorm' ||
        weatherStatrName == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStatrName == 'Clear' ||
        weatherStatrName == 'Light Cloud' ||
        weatherStatrName == 'Sunny') {
      return Colors.orange;
    } else if (weatherStatrName == 'Sleet' ||
        weatherStatrName == 'Snow' ||
        weatherStatrName == 'Hail') {
      return Colors.blue;
    } else if (weatherStatrName == 'Heavy Cioud') {
      return Colors.blueGrey;
    } else if (weatherStatrName == 'Light Rain' ||
        weatherStatrName == 'Heavy Rain' ||
        weatherStatrName == 'Showers') {
      return Colors.blue;
    } else if (weatherStatrName == 'Thunderstorm' ||
        weatherStatrName == 'Thunder') {
      return Colors.blue;
    } else {
      return Colors.blue;
    }
  }
}
