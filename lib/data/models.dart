/*
{
    "coord": {
        "lon": 73.4,
        "lat": 55
    },
    "weather": [
        {
            "id": 803,
            "main": "Clouds",
            "description": "broken clouds",
            "icon": "04d"
        }
    ],
    "base": "stations",
    "main": {
        "temp": 18.83,
        "feels_like": 18.65,
        "temp_min": 18.83,
        "temp_max": 18.94,
        "pressure": 1006,
        "humidity": 72
    },
    "visibility": 10000,
    "wind": {
        "speed": 3.13,
        "deg": 270,
        "gust": 0
    },
    "clouds": {
        "all": 75
    },
    "dt": 1657122284,
    "sys": {
        "type": 2,
        "id": 69386,
        "country": "RU",
        "sunrise": 1657060567,
        "sunset": 1657122342
    },
    "timezone": 21600,
    "id": 1496153,
    "name": "Omsk",
    "cod": 200
}
                    
 */

class WeatherInfo {
  final String description;
  final String icon;

  WeatherInfo({required this.description, required this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    return WeatherInfo(description: description, icon: icon);
  }
}

class TemperatureInfo {
  final double temperature;

  TemperatureInfo({required this.temperature});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    return TemperatureInfo(temperature: temperature);
  }
}

class WeatherResponse {
  final String cityName;
  final TemperatureInfo tempInfo;
  final WeatherInfo weatherInfo;

  String get iconUrl {
    return 'https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';
  }

  WeatherResponse(
      {required this.cityName,
      required this.tempInfo,
      required this.weatherInfo});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];

    final tempInfoJson = json['main'];
    final tempInfo = TemperatureInfo.fromJson(tempInfoJson);

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    return WeatherResponse(
        cityName: cityName, tempInfo: tempInfo, weatherInfo: weatherInfo);
  }
}
