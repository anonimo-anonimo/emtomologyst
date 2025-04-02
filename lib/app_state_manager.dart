import 'package:flutter/material.dart';

import 'viewmodels/app_router_manager.dart';
import 'viewmodels/entomologyst_view_model.dart';
import 'viewmodels/geolocation_view_model.dart';

class AppStateManager extends InheritedWidget {
  const AppStateManager({
    required super.child,
    required this.appRouterManager,
    required this.geoLocationViewModel,
    required this.entomologystViewModel,
    super.key,
  });

  final AppRouterManager appRouterManager;
  final GeoLocationViewModel geoLocationViewModel;
  final EntomologystViewModel entomologystViewModel;

  static AppStateManager of(BuildContext context) {
    final AppStateManager? result =
        context.dependOnInheritedWidgetOfExactType<AppStateManager>();
    assert(result != null, 'No AppStateManager found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(AppStateManager oldWidget) {
    return false;
  }
}
