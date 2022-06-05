import 'package:flutter/material.dart';

class WeatherIcons {
  dynamic weatherData;
  WeatherIcons({required this.weatherData});
  ImageIcon getWeatherIcon() {
    return ImageIcon(
      NetworkImage(
          'http://openweathermap.org/img/wn/${weatherData['weather'][0]['icon']}@2x.png'),
      size: 150,
    );
  }

  ImageIcon getWeeklyWeatherIcon({required int index}) {
    return ImageIcon(
      NetworkImage(
          'http://openweathermap.org/img/wn/${weatherData['list'][index]['weather'][0]['icon']}@2x.png'),
      size: 60,
    );
  }
}
