import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/1 (6).jpg'), fit: BoxFit.fill),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (value) {
                    cityName = value;
                  },
                  style: TextStyle(
                    fontSize: 22,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    icon: Icon(
                      Icons.location_city,
                      size: 40,
                      color: Colors.white.withOpacity(0.6),
                    ),
                    hintText: 'Enter City',
                    hintStyle: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                child: Text(
                  'Get Weather',
                  style: TextStyle(fontSize: 35, color: Colors.blue[100]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
