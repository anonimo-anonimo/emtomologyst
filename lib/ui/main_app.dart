import 'package:flutter/material.dart';

import '../app_state_manager.dart';
import 'app_theme.dart';
import 'pages/my_page.dart';
import 'widgets/app_router_widget.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AppStateManager appStateManager = AppStateManager.of(context);
    appStateManager.appRouterManager.initialize();
    return MaterialApp(
      theme: AppTheme.lisghtTheme, // demostramos manejo de temas en la app 😊
      home: MyPage(
        page: AppRouterWidget(router: appStateManager.appRouterManager),
      ),
    );
  }
}
