import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      longitude = position.longitude;
      latitude = position.latitude;

      print(position);
    } catch (err) {
      print(err);
    }
  }

  double getLatitude() => latitude;
  double getLongitude() => longitude;
}
