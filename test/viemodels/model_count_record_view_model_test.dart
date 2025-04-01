import 'package:emtomologyst/domain/models/model_count_record.dart';
import 'package:emtomologyst/viewmodels/model_count_record_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ModelCountRecordViewModel', () {
    late ModelCountRecordViewModel viewModel;

    setUp(() {
      viewModel = ModelCountRecordViewModel(
        const ModelCountRecord(
          insectType: 'Bee',
          geolocation: 'X,Y',
          comment: 'Near hive',
          count: 1,
        ),
      );
    });

    test('debería cambiar el tipo de insecto', () {
      viewModel.updateInsectType('Ant');
      expect(viewModel.record.insectType, 'Ant');
    });

    test('debería cambiar el comentario', () {
      viewModel.updateComment('Updated comment');
      expect(viewModel.record.comment, 'Updated comment');
    });

    test('debería incrementar el conteo', () {
      viewModel.incrementCount();
      expect(viewModel.record.count, 2);
    });
  });
}
