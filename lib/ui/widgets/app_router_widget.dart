import 'package:flutter/material.dart';

import '../../app_route.dart';
import '../../viewmodels/app_router_manager.dart';
import '../pages/home_page.dart';
import '../pages/sign_in_page.dart';
import '../pages/splash_screen_page.dart';

class AppRouterWidget extends StatelessWidget {
  const AppRouterWidget({required this.router, super.key});

  final AppRouterManager router;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: router,
      builder: (BuildContext context, Widget? child) {
        return PopScope<Widget>(
          onPopInvokedWithResult:
              (bool didPop, Widget? result) => router.back(),
          child: switch (router.route) {
            AppRoute.splash => const SplashScreenPage(),
            AppRoute.signIn => const SignInPage(),
            AppRoute.home => const HomePage(),
          },
        );
      },
    );
  }
}
