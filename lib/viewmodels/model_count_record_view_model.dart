import '../domain/entities/view_model.dart';
import '../domain/models/model_count_record.dart';

class ModelCountRecordViewModel extends ViewModel {
  ModelCountRecordViewModel(this._record);
  ModelCountRecord _record;

  ModelCountRecord get record => _record;

  void updateInsectType(String type) {
    _record = _record.copyWith(insectType: type);
    notifyListeners();
  }

  void updateComment(String comment) {
    final String updatedComment = comment.trim();
    if (updatedComment != _record.comment) {
      _record = _record.copyWith(comment: comment);
      notifyListeners();
    }
  }

  void incrementCount() {
    _record = _record.copyWith(count: _record.count + 1);
    notifyListeners();
  }

  void decrementCount() {
    if (_record.count > 0) {
      _record = _record.copyWith(count: _record.count - 1);

      notifyListeners();
    }
  }
}
