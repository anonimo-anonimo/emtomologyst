import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'pages/my_page.dart';
import 'pages/splash_screen_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lisghtTheme, // demostramos manejo de temas en la app 😊
      home: const MyPage(page: SplashScreenPage()),
    );
  }
}
