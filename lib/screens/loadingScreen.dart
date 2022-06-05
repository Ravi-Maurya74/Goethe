import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weatherly/services/weather.dart';
import 'package:weatherly/screens/mainScreen.dart';
import 'package:weatherly/utilities/customWidgets.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late dynamic weatherData;
  late dynamic weeklyWeatherData;
  void getLocationData() async {
    weatherData = await WeatherModel().getLocationData();
    weeklyWeatherData = await WeatherModel().getWeeklyLocationData();
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainScreen(
                  weatherData: weatherData,
                  weeklyWeatherData: weeklyWeatherData,
                )));
    SystemNavigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    getLocationData();
    return Scaffold(
      body: Center(
        child: LoadWidget(),
      ),
    );
  }
}
