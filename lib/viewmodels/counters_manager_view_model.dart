import '../domain/entities/view_model.dart';
import '../domain/models/model_count_record.dart';
import '../domain/models/model_insect.dart';
import 'model_count_record_view_model.dart';

class CounterManagerViewModel extends ViewModel {
  final Map<String, ModelCountRecordViewModel> _counters =
      <String, ModelCountRecordViewModel>{};

  ModelInsect get modelInsectSelected =>
      modelInsectFromModelRecord(_selectedCounter.record);

  static ModelInsect modelInsectFromModelRecord(ModelCountRecord record) {
    final String insectName = record.insectType.toLowerCase();

    final String assetPhoto = 'assets/$insectName.png';
    return ModelInsect(
      speciesName: record.insectType,
      urlPhoto: assetPhoto,
      geoLocate: record.geolocation,
      moreInfoUrl: record.comment,
    );
  }

  int get countersNumber => _counters.length;
  ModelCountRecordViewModel get selectedCounter => _selectedCounter;
  ModelCountRecordViewModel _selectedCounter = ModelCountRecordViewModel(
    const ModelCountRecord(
      insectType: 'default',
      geolocation: '',
      comment: '|URL',
      count: 0,
    ),
  );

  Map<String, ModelCountRecordViewModel> get counters => _counters;

  List<ModelCountRecord> get allCounters {
    final List<ModelCountRecord> insectNames = <ModelCountRecord>[];
    for (final ModelCountRecordViewModel value in _counters.values) {
      insectNames.add(value.record);
    }
    return insectNames;
  }

  void addCounter(ModelCountRecord record) {
    if (!_counters.containsKey(record.insectType)) {
      _counters[record.insectType.toLowerCase()] = ModelCountRecordViewModel(
        record,
      );
    }
  }

  String counterKey(ModelCountRecord record) {
    return record.insectType.toLowerCase();
  }

  ModelCountRecordViewModel counterByInsectName(String name) {
    return counter(
      ModelCountRecord(
        insectType: name,
        geolocation: '',
        comment: '|URL',
        count: 0,
      ),
    );
  }

  ModelCountRecordViewModel counter(ModelCountRecord record) {
    addCounter(record);
    assert(
      _counters.containsKey(counterKey(record)),
      'Debe contener un contador con el registro solicitado',
    );
    return _counters[counterKey(record)]!;
  }

  void incrementCounter(ModelCountRecord record) {
    counter(record).incrementCount();
  }

  void clear() {
    for (final ModelCountRecordViewModel counter in _counters.values) {
      counter.dispose();
    }
    _counters.clear();
  }

  Future<void> initializeDefaultInsects() async {
    if (_counters.isNotEmpty) {
      return;
    }
    const List<String> defaultInsects = <String>[
      'Hormiga',
      'Abeja',
      'Abejorro',
      'Avispa',
      'Otro',
    ];

    for (final String name in defaultInsects) {
      addCounter(
        ModelCountRecord(
          insectType: name,
          geolocation: '',
          comment: 'Default insect',
          count: 0,
        ),
      );
    }
    if (selectedCounter.record.insectType == 'default') {
      _selectedCounter = _counters.values.first;
    }
    notifyListeners();
  }

  void setSelectedCounter(ModelCountRecordViewModel counter) {
    _selectedCounter = counter;
    notifyListeners();
  }

  @override
  void dispose() {
    clear();
    super.dispose();
  }
}
