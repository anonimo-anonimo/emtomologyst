import 'package:flutter/material.dart';

import 'app_state_manager.dart';
import 'ui/main_app.dart';
import 'viewmodels/app_router_manager.dart';
import 'viewmodels/entomologyst_view_model.dart';
import 'viewmodels/geolocation_view_model.dart';

void main() {
  runApp(
    AppStateManager(
      appRouterManager: AppRouterManager(),
      geoLocationViewModel: GeoLocationViewModel(),
      entomologystViewModel: EntomologystViewModel(),
      child: const MainApp(),
    ),
  );
}
