import '../domain/models/geo_location.dart';

class GeolocationService {
  const GeolocationService();

  Future<GeoLocation> getCurrentPosition() async {
    return const GeoLocation(lat: 0.0, lng: 0.0);
  }

  Future<bool> locationPermission() async {
    return false;
  }
}
