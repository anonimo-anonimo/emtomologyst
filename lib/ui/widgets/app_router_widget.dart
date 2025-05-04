import 'package:flutter/material.dart';

import '../../app_route.dart';
import '../../viewmodels/app_router_manager.dart';
import '../pages/counter_page.dart';
import '../pages/detailed_counter_page.dart';
import '../pages/home_page.dart';
import '../pages/info_page.dart';
import '../pages/loading_page.dart';
import '../pages/new_specie_form_page.dart';
import '../pages/profile_page.dart';
import '../pages/records_page.dart';
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
            AppRoute.isLoading => const LoadingPage(),
            AppRoute.profilePage => const ProfilePage(),
            AppRoute.newSpecieFormPage => const NewSpecieFormPage(),
            AppRoute.counterPage => const CounterPage(),
            AppRoute.recordsPage => const RecordsPage(),
            AppRoute.infoPage => const InfoPage(),
            AppRoute.detailedCounterPage => const DetailedCounterPage(),
          },
        );
      },
    );
  }
}
