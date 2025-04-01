import 'package:shared_preferences/shared_preferences.dart';

import '../app_route.dart';
import '../domain/entities/view_model.dart';

class AppRouterManager extends ViewModel {
  bool _isInitializated = false;
  static const String isFirstTimeKey = 'isFirstTime';
  AppRoute _route = AppRoute.splash;
  AppRoute get route {
    return _route;
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

  void goToNewRoute(AppRoute newRoute) {
    _route = newRoute;
    notifyListeners();
  }

  bool back() {
    if (_route != AppRoute.splash && _route != AppRoute.home) {
      _route = AppRoute.home;
      notifyListeners();
      return true;
    }
    return false;
  }
}
