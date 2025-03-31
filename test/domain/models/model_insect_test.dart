import 'dart:convert';

import 'package:emtomologyst/domain/models/model_insect.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Model insect', () {
    const ModelInsect baseInsect = ModelInsect(
      speciesName: 'Abeja Maya',
      urlPhoto: 'https://insectos.com/abeja.jpg',
      geoLocate: '5.070275,-75.513817',
      moreInfoUrl: 'https://insectos.com/abeja',
    );
    test('deberíua ser igual a otra instanciacon los mismos valores', () {
      const ModelInsect copy = ModelInsect(
        speciesName: 'Abeja Maya',
        urlPhoto: 'https://insectos.com/abeja.jpg',
        geoLocate: '5.070275,-75.513817',
        moreInfoUrl: 'https://insectos.com/abeja',
      );
      expect(baseInsect == copy, isTrue);
      expect(baseInsect.hashCode, copy.hashCode);
    });
    test('fromJson debería crear una instancia válida', () {
      final Map<String, String> json = <String, String>{
        'speciesName': 'Abeja Maya',
        'urlPhoto': 'https://insectos.com/abeja.jpg',
        'geoLocate': '5.070275,-75.513817',
        'moreInfoUrl': 'https://insectos.com/abeja',
      };

      final ModelInsect insect = baseInsect.fromJson(json);

      expect(insect, equals(baseInsect));
    });

    test('fromString debería crear una instancia válida desde un JSON', () {
      final String jsonString = jsonEncode(<String, String>{
        'speciesName': 'Abeja Maya',
        'urlPhoto': 'https://insectos.com/abeja.jpg',
        'geoLocate': '5.070275,-75.513817',
        'moreInfoUrl': 'https://insectos.com/abeja',
      });

      final ModelInsect insect = baseInsect.fromString(jsonString);

      expect(insect, equals(baseInsect));
    });

    test(
      'fromString debería retornar una instancia de error si hay fallo en el parseo',
      () {
        const String jsonString = '{mal json}';

        final ModelInsect insect = baseInsect.fromString(jsonString);

        expect(insect.speciesName, 'Error specie');
        expect(insect.moreInfoUrl, contains('FormatException'));
      },
    );

    test('copyWith debería modificar solo lo necesario', () {
      final ModelInsect copy = baseInsect.copyWith(
        urlPhoto: 'https://insectos.com/abeja2.jpg',
      );

      expect(copy.speciesName, equals(baseInsect.speciesName));
      expect(copy.geoLocate, equals(baseInsect.geoLocate));
      expect(copy.moreInfoUrl, equals(baseInsect.moreInfoUrl));
      expect(copy.urlPhoto, equals('https://insectos.com/abeja2.jpg'));
    });
  });
}
