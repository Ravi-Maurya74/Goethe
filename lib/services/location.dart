import 'package:geolocator/geolocator.dart';

class Location {
  late Position position;
  late double latitude, longitude;
  Future<void> getCurrentLocation() async {
    askPermission();
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    } catch (e) {
      print(e);
    }
    latitude = position.latitude;
    longitude = position.longitude;
  }

  void printLocation() {
    print('latitude - $latitude');
    print('longitude - $longitude');
  }

  void askPermission() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      LocationPermission permission = await Geolocator.requestPermission();
      print(permission);
    }
  }
}
