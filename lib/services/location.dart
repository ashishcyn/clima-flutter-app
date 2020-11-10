import 'package:geolocator/geolocator.dart';

class Location {
  double lattitude;
  double longitude;
  Location({this.lattitude, this.longitude});

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      lattitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
