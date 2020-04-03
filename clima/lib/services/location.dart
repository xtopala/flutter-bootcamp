import 'package:geolocator/geolocator.dart';

class Location {
  double lat;
  double lon;

  Future<void> getCurrentLocation() async {
    try {
      Position pos = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      lat = pos.latitude;
      lon = pos.longitude;
    } catch (e) {
      print(e);
    }
  }
}
