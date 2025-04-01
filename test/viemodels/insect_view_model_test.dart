import 'package:emtomologyst/domain/models/geo_location.dart';
import 'package:emtomologyst/domain/models/model_insect.dart';
import 'package:emtomologyst/viewmodels/insect_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('InsectViewModel', () {
    late InsectViewModel viewModel;

    setUp(() {
      viewModel = InsectViewModel(
        const ModelInsect(
          speciesName: 'Bee',
          urlPhoto: 'https://photo.com',
          geoLocate: '0,0',
          moreInfoUrl: 'https://info.com',
        ),
      );
    });

    test('debería actualizar el nombre de la especie', () {
      viewModel.updateSpecies('Wasp');
      expect(viewModel.insect.speciesName, 'Wasp');
    });

    test('debería actualizar la foto', () {
      viewModel.updatePhoto('https://newphoto.com');
      expect(viewModel.insect.urlPhoto, 'https://newphoto.com');
    });

    test('debería actualizar la info extra', () {
      viewModel.updateMoreInfo('https://newinfo.com');
      expect(viewModel.insect.moreInfoUrl, 'https://newinfo.com');
    });

    test('debería actualizar la geolocalización', () {
      const GeoLocation geo = GeoLocation(lat: 6.5, lng: -75.5);
      viewModel.updateGeo(geo);
      expect(viewModel.insect.geoLocate, geo.toString());
    });
  });
}
