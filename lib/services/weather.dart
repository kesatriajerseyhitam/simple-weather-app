import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherModel {
  String apiKey = '076fedf700231f94bbff4ad10abcc2da';
  HttpService http = HttpService('https://api.openweathermap.org/data/2.5/');

  Future<dynamic> getLocationData() async {
    Location location = Location();
    await location.getLocation();
    return await http.get(
        'weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
  }

  Future<dynamic> getCityData(String city) async =>
      await http.get('weather?q=$city&appid=$apiKey&units=metric');

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
