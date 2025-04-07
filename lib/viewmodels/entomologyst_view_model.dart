import '../domain/entities/view_model.dart';
import '../domain/models/geo_location.dart';
import '../domain/models/model_entomologist.dart';

class EntomologystViewModel extends ViewModel {
  EntomologystViewModel([this._entomologist = defaultEntomologist]);
  static const ModelEntomologist defaultEntomologist = ModelEntomologist(
    name: 'Default',
    urlPhoto: 'assets/default_profile.png',
    geoLocate: '{"lat":0,"lng":0}',
  );
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
    _entomologist = _entomologist.copyWith(name: newName);
    notifyListeners();
  }
}
