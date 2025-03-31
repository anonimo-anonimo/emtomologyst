import 'package:emtomologyst/domain/models/geo_location.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GeoLocation', () {
    test('toJson y fromJson', () {
      const GeoLocation geo = GeoLocation(lat: 10.5, lng: -73.4);
      final Map<String, dynamic> json = geo.toJson();
      final GeoLocation geoFromJson = geo.fromJson(json);
      expect(geoFromJson, equals(geo));
    });

    test('copyWith', () {
      const GeoLocation geo = GeoLocation(lat: 10.0, lng: 20.0);
      final GeoLocation copy = geo.copyWith(lat: 30.0);
      expect(copy.lat, 30.0);
      expect(copy.lng, 20.0);
    });

    test('== y hashCode', () {
      const GeoLocation a = GeoLocation(lat: 5.0, lng: 5.0);
      const GeoLocation b = GeoLocation(lat: 5.0, lng: 5.0);
      expect(a == b, isTrue);
      expect(a.hashCode, equals(b.hashCode));
    });
  });
}
