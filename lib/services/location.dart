import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;

  Location() {}

  Future<void> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    LocationPermission permission1 = await Geolocator.checkPermission();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
      print(position);
    } catch (e) {}
  }
}
