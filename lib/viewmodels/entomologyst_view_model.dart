import 'package:shared_preferences/shared_preferences.dart';

import '../domain/entities/view_model.dart';
import '../domain/models/geo_location.dart';
import '../domain/models/model_entomologist.dart';
import 'app_router_manager.dart';

class EntomologystViewModel extends ViewModel {
  EntomologystViewModel([this._entomologist = defaultEntomologist]);
  static const ModelEntomologist defaultEntomologist = ModelEntomologist(
    name: 'Default',
    urlPhoto: 'assets/default_profile.png',
    geoLocate: '{"lat":0,"lng":0}',
  );
  static const String entomologistKey = 'entomologistKey';
  ModelEntomologist _entomologist;
  ModelEntomologist get entomologist => _entomologist;

  // cumple con lo solicitado en la prueba manteniendo una clara separacion entre
  // la logica de negocio y el estado de la data (Dando visos de trabajo con inmutabilidad)
  void updateUrlPhoto(String newUrl) {
    _entomologist = _entomologist.copyWith(urlPhoto: newUrl);
    notifyListeners();
  }

  void updateGeolocate(GeoLocation newGeo) {
    _entomologist = _entomologist.copyWith(geoLocate: newGeo.toString());
    notifyListeners();
  }

  // Estos no nos los pidieron pero son necesarios para generar el CRUD del entomologo
  void updateName(String newName) {
    if (newName.isNotEmpty) {
      _entomologist = _entomologist.copyWith(name: newName);
      notifyListeners();
    }
  }

  Future<void> saveEntomologistToPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(AppRouterManager.isFirstTimeKey, false);
    prefs.setString(entomologistKey, _entomologist.toString());
  }
}
