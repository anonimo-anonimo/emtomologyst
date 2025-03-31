import 'package:emtomologyst/domain/models/model_entomologist.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ModelEntomologist', () {
    const ModelEntomologist entomologist = ModelEntomologist(
      name: 'Dr. Bug',
      urlPhoto: 'photo_url',
      geoLocate: 'geo',
    );

    test('toJson y fromJson', () {
      final Map<String, dynamic> json = entomologist.toJson();
      final ModelEntomologist fromJson = entomologist.fromJson(json);
      expect(fromJson, equals(entomologist));
    });

    test('copyWith', () {
      final ModelEntomologist updated = entomologist.copyWith(
        name: 'Prof. Insect',
      );
      expect(updated.name, 'Prof. Insect');
      expect(updated.urlPhoto, entomologist.urlPhoto);
    });

    test('== y hashCode', () {
      const ModelEntomologist other = ModelEntomologist(
        name: 'Dr. Bug',
        urlPhoto: 'photo_url',
        geoLocate: 'geo',
      );
      expect(entomologist == other, isTrue);
      expect(entomologist.hashCode, equals(other.hashCode));
    });
  });
}
