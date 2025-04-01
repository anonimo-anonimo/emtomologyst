import 'package:emtomologyst/domain/models/geo_location.dart';
import 'package:emtomologyst/domain/models/model_entomologist.dart';
import 'package:emtomologyst/viewmodels/entomologyst_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

// Exposición del modelo inicial
//
// Actualización de urlPhoto con notifyListeners()
//
// Actualización de geoLocate con notifyListeners()
//
// Actualización de name con notifyListeners()

void main() {
  group('EntomologystViewModel', () {
    late EntomologystViewModel viewModel;
    late ModelEntomologist initial;
    setUp(() {
      initial = const ModelEntomologist(
        name: 'Dra. Beetle',
        urlPhoto: 'https://photo.url',
        geoLocate: '0,0',
      );
      viewModel = EntomologystViewModel(initial);
    });
    test('Exposición del modelo inicial', () {
      expect(viewModel.entomologist, equals(initial));
    });

    test('debería actualizar la urlPhoto y notificar listeners', () {
      int notificationCount = 0;
      viewModel.addListener(() => notificationCount++);
      viewModel.updateUrlPhoto('https://new.photo');

      expect(viewModel.entomologist.urlPhoto, 'https://new.photo');
      expect(notificationCount, 1);
    });

    test('debería actualizar la geolocalización y notificar listeners', () {
      int notificationCount = 0;
      viewModel.addListener(() => notificationCount++);
      viewModel.updateGeolocate(const GeoLocation(lat: 5.5, lng: -73.3));

      expect(viewModel.entomologist.geoLocate, '{"lat":5.5,"lng":-73.3}');
      expect(notificationCount, 1);
    });
    test('debería actualizar el nombre y notificar listeners', () {
      int notificationCount = 0;
      viewModel.addListener(() => notificationCount++);
      viewModel.updateName('Prof. Insecta');

      expect(viewModel.entomologist.name, 'Prof. Insecta');
      expect(notificationCount, 1);
    });
  });
}
