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
  final int weatherId;

  String get pictureUrl {
    if (this.weatherId < 300) {
      return 'assets/storm_cat.png';
    } else if (this.weatherId < 400) {
      return 'assets/rain_cat.png';
    } else if (this.weatherId < 600) {
      return 'assets/rain_cat.png';
    } else if (this.weatherId < 700) {
      return 'assets/snow_cat.png';
    } else if (this.weatherId < 800) {
      return 'assets/cloud_cat.png';
    } else if (this.weatherId == 800) {
      return 'assets/sun_cat.png';
    } else if (this.weatherId <= 804) {
      return 'assets/cloud_cat.png';
    } else {
      return 'assets/sun_cat.png';
    }
  }

  String get iconUrl {
    if (this.weatherId < 300) {
      return 'assets/icon/Storm_Icone.png';
    } else if (this.weatherId < 400) {
      return 'assets/icon/Rain_Icone.png';
    } else if (this.weatherId < 600) {
      return 'assets/icon/Rain_Icone.png';
    } else if (this.weatherId < 700) {
      return 'assets/icon/Snow_Icone.png';
    } else if (this.weatherId < 800) {
      return 'assets/icon/Cloud_icone1.png';
    } else if (this.weatherId == 800) {
      return 'assets/icon/Sun_Icone.png';
    } else if (this.weatherId <= 802) {
      return 'assets/icon/Cloud_Icone1.png';
    } else if (this.weatherId <= 804) {
      return 'assets/icon/Cloud_Icone2.png';
    } else {
      return 'assets/icon/Sun_Down_Icone.png';
    }
  }

  WeatherInfo(
      {required this.description, required this.icon, required this.weatherId});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    final weatherId = json['id'];
    return WeatherInfo(
        description: description, icon: icon, weatherId: weatherId.toInt());
  }
}

class TemperatureInfo {
  final int temperature;
  final int feelsLike;

  TemperatureInfo({required this.temperature, required this.feelsLike});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    final feelsLike = json['feels_like'];

    return TemperatureInfo(
        temperature: temperature.toInt(), feelsLike: feelsLike.toInt());
  }
}

class WeatherResponse {
  final String cityName;
  final TemperatureInfo tempInfo;
  final WeatherInfo weatherInfo;

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
/*
class ForecastResponce{
  final 
}*/
