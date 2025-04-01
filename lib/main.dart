import 'package:flutter/material.dart';

import 'app_state_manager.dart';
import 'ui/main_app.dart';
import 'viewmodels/app_router_manager.dart';

void main() {
  runApp(
    AppStateManager(
      appRouterManager: AppRouterManager(),
      child: const MainApp(),
    ),
  );
}
