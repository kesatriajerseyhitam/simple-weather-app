import 'package:geolocator/geolocator.dart';

class Location {
  double _longitude;
  double _latitude;

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      _longitude = position.longitude;
      _latitude = position.latitude;

      print(position);
    } catch (err) {
      print(err);
    }
  }

  double getLatitude() => _latitude;
  double getLongitude() => _longitude;
}
