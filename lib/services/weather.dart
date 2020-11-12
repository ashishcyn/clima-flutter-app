import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';
import 'package:clima/config/constants.dart' as config;

const API_KEY = config.apiKey;
const WEATHERMAP_URL = config.openWeatherMapURL;

class WeatherModel {
  getCityWeather(String cityName) async {
    var url = '$WEATHERMAP_URL?q=c$cityName&appid=$API_KEY&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    Future<dynamic> weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    print('Gonna call Weather API:::::::');
    NetworkHelper networkHelper = NetworkHelper(
        '$WEATHERMAP_URL?lat=${location.latitude}&lon=${location.longitude}&appid=$API_KEY&units=metric');
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
