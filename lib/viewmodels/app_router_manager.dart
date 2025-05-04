import 'package:shared_preferences/shared_preferences.dart';

import '../app_route.dart';
import '../domain/entities/view_model.dart';

class AppRouterManager extends ViewModel {
  bool _isInitializated = false;
  bool _isLoading = false;
  static const String isFirstTimeKey = 'isFirstTime';
  AppRoute _route = AppRoute.splash;
  AppRoute get route {
    return _route;
  }

  bool get isLoading => _isInitializated;
  void setIsloading(bool value) {
    _isLoading = value;
    if (_isLoading) {
      _route = AppRoute.isLoading;
    }
    notifyListeners();
  }

  Future<void> reInitializate() async {
    _isInitializated = false;
    initialize();
  }

  Future<void> initialize() async {
    if (!_isInitializated) {
      await Future<void>.delayed(const Duration(seconds: 5));
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final bool isFirstTime = prefs.getBool(isFirstTimeKey) ?? true;
      if (isFirstTime) {
        _route = AppRoute.signIn;
      } else {
        _route = AppRoute.home;
      }
      _isInitializated = true;
      notifyListeners();
    }
  }

  void checkEntomologyst() {
    _isInitializated = false;
    initialize();
  }

  void goToNewRoute(AppRoute newRoute) {
    _route = newRoute;
    notifyListeners();
  }

  bool back() {
    if (_route != AppRoute.splash && _route != AppRoute.home && isLoading) {
      _route = AppRoute.home;
      notifyListeners();
      return true;
    }
    return false;
  }
}
