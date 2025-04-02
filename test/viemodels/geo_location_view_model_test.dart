import 'package:emtomologyst/viewmodels/geolocation_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GeoLocationViewModel', () {
    late GeoLocationViewModel viewModel;

    setUp(() {
      viewModel = GeoLocationViewModel();
    });

    test('debería actualizar latitud', () {
      viewModel.updateLat(10.0);
      expect(viewModel.location.lat, 10.0);
    });

    test('debería actualizar longitud', () {
      viewModel.updateLng(-70.0);
      expect(viewModel.location.lng, -70.0);
    });

    test('debería actualizar ambos valores', () {
      viewModel.updateBoth(5.5, -5.5);
      expect(viewModel.location.lat, 5.5);
      expect(viewModel.location.lng, -5.5);
    });
  });
}
