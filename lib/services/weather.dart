import 'package:weather_app_flutter/services/location.dart';
import 'package:weather_app_flutter/services/networking.dart';

const apiKey = '5677c9fcdd0823346332ba920dcea180';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    double latitude = location.latitude;
    double longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'Cloudy';
    } else if (condition < 400) {
      return 'CLear';
    } else if (condition < 600) {
      return 'Rainy️';
    } else if (condition < 700) {
      return 'Snowy️';
    } else if (condition < 800) {
      return 'Clear';
    } else if (condition == 800) {
      return 'Sunny️';
    } else if (condition <= 804) {
      return 'Cloudy️';
    } else {
      return 'Clear';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s icecream time';
    } else if (temp > 20) {
      return 'Time for shorts and T-shirts';
    } else if (temp < 10) {
      return 'You\'ll need Scarf';
    } else {
      return 'Bring a Jacket just in case';
    }
  }
}
