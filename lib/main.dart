import 'package:flutter/material.dart';

import 'app_state_manager.dart';
import 'ui/main_app.dart';
import 'viewmodels/app_router_manager.dart';
import 'viewmodels/counters_manager_view_model.dart';
import 'viewmodels/entomologyst_view_model.dart';
import 'viewmodels/geolocation_view_model.dart';

void main() {
  runApp(
    AppStateManager(
      counterManager: CounterManagerViewModel(),
      appRouterManager: AppRouterManager(),
      geoLocationViewModel: GeoLocationViewModel(),
      entomologystViewModel: EntomologystViewModel(),
      child: const MainApp(),
    ),
  );
}
