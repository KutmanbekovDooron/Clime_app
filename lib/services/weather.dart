import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'networking.dart';
const apiKey = 'c4498f603e095a7209bd4a7d5f43abc9';
const openWeatherMapURL = "api.openweathermap.org";
const openWeatherMapURLContainu = "data/2.5/weather";

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName){
    var urlObject = Uri.https(openWeatherMapURL, openWeatherMapURLContainu, {
      'q' : cityName,
      'appid' : apiKey,
      'units' : 'metric'
    });

    print(urlObject);
    NetworkHelper helper = NetworkHelper(urlObject);

    return helper.getData();
  }

  Future<dynamic> getLocationWeather()async {
    Location location = Location();
    await location.getCurrentLocation();
    var uriObject = Uri.https(
        "api.openweathermap.org",
        openWeatherMapURLContainu, {
      "lat" : {location.latitude.toString()},
      "lon": {location.longitude.toString()},
      "appid": apiKey,
      'units' : 'metric'
    });
    print(uriObject);

    NetworkHelper networkHelper = NetworkHelper(uriObject);

    return networkHelper.getData();
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
