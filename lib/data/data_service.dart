import 'dart:convert';

import 'package:meow_weather/data/models.dart';
import 'package:http/http.dart' as http;

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final queryParameters = {
      'q': city,
      'appid': 'ef6c8587dd6f50fca77bd0278365f313',
      'units': 'metric',
      'lang': 'ru'
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    //print(response.body);
    final json = jsonDecode(response.body);

    if (json['cod'] == 200) {
      return WeatherResponse.fromJson(json);
    } else {
      return WeatherResponse(
          cityName: 'Unknown',
          tempInfo: TemperatureInfo(temperature: 0, feelsLike: 0),
          weatherInfo: WeatherInfo(description: '', icon: '', weatherId: 800));
    }
  }
}
/*
class ForecastService {
  Future<ForecastResponse> getWeather(String city, int castNum) async {
    
    final queryParameters = {
      'q': city,
      'appid': 'ef6c8587dd6f50fca77bd0278365f313',
      'units': 'metric',
      'lang': 'ru',
      'cnt': castNum
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/forecast', queryParameters);

    final response = await http.get(uri);

    //print(response.body);
    final json = jsonDecode(response.body);

    if (json['cod'] == 200) {
      return ForecastResponse.fromJson(json);
    } else {
      return null;
    }
  }
}
*/