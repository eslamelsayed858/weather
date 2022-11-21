import 'dart:convert';

import 'package:hallo_cs/model/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apikey = '47f9e4aa268444aa8b5125933221508';
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;

    try {
      Uri url =
          Uri.parse('$baseUrl/forecast.json?key=$apikey&q=$cityName&days=7');

      http.Response response = await http.get(url);

      Map<String, dynamic> data = jsonDecode(response.body);

      weather = WeatherModel.fromJson(data);
    } catch (e) {
      print(e);
    }
    return weather;
  }
}
