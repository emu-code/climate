import 'package:climate/services/location.dart';
import 'package:climate/services/networking.dart';

const apiKey = '3010187b5a95267dba8667ec66e375bb';
const weatherMapURL = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  //Getting city weather depending on city name searched
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$weatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    //Getting weather data from our http call in netwrking folder
    NetworkHelper networkHelper =
        NetworkHelper('$weatherMapURL?lat=${location.latitude}&lon='
            '${location.longitude}&appid=$apiKey&units=metric');
    //Getting the weather from the newtwork
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
