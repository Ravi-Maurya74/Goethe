import 'package:weatherly/services/location.dart';
import 'package:weatherly/services/networking.dart';

const api = '9656114d4f6d2f8d392f76055ce3553d';

class WeatherModel {
  Future getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    location.printLocation();
    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$api&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future getCityWeather(String city) async {
    String url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$api&units=metric';
    var weatherData = await NetworkHelper(url: url).getData();
    return weatherData;
  }

  Future getWeeklyLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    location.printLocation();
    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/forecast?lat=${location.latitude}&lon=${location.longitude}&appid=$api&units=metric');
    return await networkHelper.getData();
  }

  Future getWeeklyCityWeather(String city) async {
    return await NetworkHelper(
            url:
                'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$api&units=metric')
        .getData();
  }
}

class DailyWeatherData {
  dynamic weatherData;
  late String city, country, description;
  late double temp;
  late int temperature, feelsLike, humidity;
  void update(dynamic data) {
    weatherData = data;
    city = weatherData['name'];
    country = weatherData['sys']['country'];
    temp = weatherData['main']['temp'];
    temperature = temp.toInt();
    description = weatherData['weather'][0]['description'];
    feelsLike = weatherData['main']['feels_like'].toInt();
    humidity = weatherData['main']['humidity'].toInt();
  }
}

class WeeklyWeatherData {
  dynamic weeklyWeatherData;
  late int minTemp, maxTemp, humidity;
  void update({dynamic data, required int index}) {
    weeklyWeatherData = data;
    minTemp = weeklyWeatherData['list'][index]['main']['temp_min'].toInt();
    maxTemp = weeklyWeatherData['list'][index]['main']['temp_max'].toInt();
    humidity = weeklyWeatherData['list'][index]['main']['humidity'].toInt();
  }
}
