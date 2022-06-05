import 'package:flutter/material.dart';
import 'package:weatherly/services/dateTime.dart';
import 'package:weatherly/services/weather.dart';
import 'package:weatherly/utilities/customWidgets.dart';
import 'package:weatherly/services/weatherIcons.dart';
import 'package:weatherly/screens/cityScreen.dart';

class MainScreen extends StatefulWidget {
  final dynamic weatherData;
  final dynamic weeklyWeatherData;
  MainScreen({required this.weatherData, required this.weeklyWeatherData});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  dynamic data1, data2;
  DailyWeatherData dailyWeatherData = DailyWeatherData();
  WeeklyWeatherData weeklyWeatherData = WeeklyWeatherData();
  WeeklyWeatherData weeklyWeatherData1 = WeeklyWeatherData();
  WeeklyWeatherData weeklyWeatherData2 = WeeklyWeatherData();
  WeeklyWeatherData weeklyWeatherData3 = WeeklyWeatherData();
  void updateUI({var dailyData, var weeklyData}) {
    setState(() {
      data1 = dailyData;
      data2 = weeklyData;
      dailyWeatherData.update(dailyData);
      weeklyWeatherData.update(index: 8, data: weeklyData);
      weeklyWeatherData1.update(index: 16, data: weeklyData);
      weeklyWeatherData2.update(index: 24, data: weeklyData);
      weeklyWeatherData3.update(index: 32, data: weeklyData);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(
        dailyData: widget.weatherData, weeklyData: widget.weeklyWeatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/1 (5).jpg'), fit: BoxFit.fill),
        ),
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              getTime(),
              style: TextStyle(
                fontSize: 70,
              ),
            ),
            Text(
              getDate(),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            ReusableCard(
              cardchild: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(getDay1()),
                      WeatherIcons(weatherData: data2)
                          .getWeeklyWeatherIcon(index: 8),
                      Text(
                          '${weeklyWeatherData.minTemp}°/${weeklyWeatherData.maxTemp}°'),
                      Text('${weeklyWeatherData.humidity}% rain'),
                    ],
                  ),
                  Column(children: [
                    Text(getDay2()),
                    WeatherIcons(weatherData: data2)
                        .getWeeklyWeatherIcon(index: 16),
                    Text(
                        '${weeklyWeatherData1.minTemp}°/${weeklyWeatherData1.maxTemp}°'),
                    Text('${weeklyWeatherData1.humidity}% rain'),
                  ]),
                  Column(children: [
                    Text(getDay3()),
                    WeatherIcons(weatherData: data2)
                        .getWeeklyWeatherIcon(index: 24),
                    Text(
                        '${weeklyWeatherData2.minTemp}°/${weeklyWeatherData2.maxTemp}°'),
                    Text('${weeklyWeatherData2.humidity}% rain'),
                  ]),
                  Column(children: [
                    Text(getDay4()),
                    WeatherIcons(weatherData: data2)
                        .getWeeklyWeatherIcon(index: 32),
                    Text(
                        '${weeklyWeatherData3.minTemp}°/${weeklyWeatherData3.maxTemp}°'),
                    Text('${weeklyWeatherData3.humidity}% rain'),
                  ]),
                ],
              ),
            ),
            ReusableCard(
              cardchild: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${dailyWeatherData.country}, ${dailyWeatherData.city}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              '${dailyWeatherData.temperature}°',
                              style: TextStyle(
                                fontSize: 50,
                              ),
                            ),
                            Text(
                              'feels like - ${dailyWeatherData.feelsLike}°',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              '${dailyWeatherData.description}',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              'humidity - ${dailyWeatherData.humidity}',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        Transform.scale(
                          scale: 1.7,
                          child:
                              WeatherIcons(weatherData: data1).getWeatherIcon(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          var wData = await WeatherModel().getLocationData();
                          var wwData =
                              await WeatherModel().getWeeklyLocationData();
                          updateUI(dailyData: wData, weeklyData: wwData);
                        },
                        child: Icon(
                          Icons.cloud,
                          size: 40,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('UPDATE'),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          String city = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CityScreen()));
                          updateUI(
                              dailyData:
                                  await WeatherModel().getCityWeather(city),
                              weeklyData: await WeatherModel()
                                  .getWeeklyCityWeather(city));
                        },
                        child: Icon(
                          Icons.near_me,
                          size: 40,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('CITY WEATHER'),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
