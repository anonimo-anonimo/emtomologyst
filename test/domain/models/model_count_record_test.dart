import 'package:emtomologyst/domain/models/model_count_record.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ModelCountRecord', () {
    const ModelCountRecord record = ModelCountRecord(
      insectType: 'Ant',
      geolocation: '123,456',
      comment: 'seen near tree',
      count: 3,
    );

    test('toJson y fromJson', () {
      final Map<String, dynamic> json = record.toJson();
      final ModelCountRecord fromJson = record.fromJson(json);
      expect(fromJson, equals(record));
    });

    test('copyWith', () {
      final ModelCountRecord copy = record.copyWith(count: 5);
      expect(copy.count, 5);
      expect(copy.insectType, record.insectType);
    });

    test('== y hashCode', () {
      const ModelCountRecord other = ModelCountRecord(
        insectType: 'Ant',
        geolocation: '123,456',
        comment: 'seen near tree',
        count: 3,
      );
      expect(record == other, isTrue);
      expect(record.hashCode, equals(other.hashCode));
    });
  });
}
