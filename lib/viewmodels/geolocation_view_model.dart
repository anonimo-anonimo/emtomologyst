import '../domain/entities/view_model.dart';
import '../domain/models/geo_location.dart';

class GeoLocationViewModel extends ViewModel {
  GeoLocationViewModel(this._location);
  GeoLocation _location;

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
}
