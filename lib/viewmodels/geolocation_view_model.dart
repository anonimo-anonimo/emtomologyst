import '../domain/entities/view_model.dart';
import '../domain/models/geo_location.dart';
import '../services/geolocation_service.dart';

class GeoLocationViewModel extends ViewModel {
  GeoLocationViewModel([
    this._location = defaultGeolocation,
    this.geolocationService = const GeolocationService(),
  ]);
  static const GeoLocation defaultGeolocation = GeoLocation(lat: 0.0, lng: 0.0);

  GeoLocation _location;
  bool _hasLocationPermission = false;
  GeolocationService geolocationService;

  bool get hasLocationPermission => _hasLocationPermission;
  GeoLocation get location => _location;

  void updateLat(double lat) {
    _location = _location.copyWith(lat: lat);
    notifyListeners();
  }

  void updateLng(double lng) {
    _location = _location.copyWith(lng: lng);
    notifyListeners();
  }

  void updateBoth(double lat, double lng) {
    _location = _location.copyWith(lat: lat, lng: lng);
    notifyListeners();
  }

  Future<void> fetchCurrentLocation() async {
    _location = await geolocationService.getCurrentPosition();
    notifyListeners();
  }

  Future<void> getLocationPermission() async {
    _hasLocationPermission = await geolocationService.locationPermission();
    notifyListeners();
  }

  void setUserLocationPermission(bool value) {
    _hasLocationPermission = value;
    notifyListeners();
  }
}
