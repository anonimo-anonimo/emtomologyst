import 'package:flutter/material.dart';

import '../../domain/models/model_insect.dart';
import '../domain/models/geo_location.dart';

class InsectViewModel extends ChangeNotifier {
  InsectViewModel(this._model);
  ModelInsect _model;

  ModelInsect get insect => _model;

  void updateSpecies(String name) {
    _model = _model.copyWith(speciesName: name);
    notifyListeners();
  }

  void updatePhoto(String url) {
    _model = _model.copyWith(urlPhoto: url);
    notifyListeners();
  }

  void updateMoreInfo(String url) {
    _model = _model.copyWith(moreInfoUrl: url);
    notifyListeners();
  }

  void updateGeo(GeoLocation geo) {
    _model = _model.copyWith(geoLocate: geo.toString());
    notifyListeners();
  }
}
