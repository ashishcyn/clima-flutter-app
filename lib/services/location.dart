import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;
  Location({this.latitude, this.longitude});

  Future<void> getCurrentLocation() async {
    print(':::getCurrentLocation:::::::::::::::::::::');
    try {
      // TODO:-------------------------------------temp
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
      //latitude = 13.0827;
      //longitude = -12.2707;
      print('Latitude:::$latitude Longitude:::$longitude');
    } catch (e) {
      print('getCurrentLocation in ERROR::::::$e');
    }
  }
}
