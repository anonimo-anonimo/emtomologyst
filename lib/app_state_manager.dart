import 'package:flutter/material.dart';

import 'app_route.dart';
import 'viewmodels/app_router_manager.dart';
import 'viewmodels/counters_manager_view_model.dart';
import 'viewmodels/entomologyst_view_model.dart';
import 'viewmodels/geolocation_view_model.dart';
import 'viewmodels/model_count_record_view_model.dart';

class AppStateManager extends InheritedWidget {
  const AppStateManager({
    required super.child,
    required this.appRouterManager,
    required this.geoLocationViewModel,
    required this.entomologystViewModel,
    required this.counterManager,
    super.key,
  });

  final AppRouterManager appRouterManager;
  final GeoLocationViewModel geoLocationViewModel;
  final EntomologystViewModel entomologystViewModel;
  final CounterManagerViewModel counterManager;

  Future<void> updateProfile() async {
    executeFunctionWidthLoading(() async {
      await Future<void>.delayed(const Duration(seconds: 2));
      appRouterManager.goToNewRoute(AppRoute.profilePage);
    });
  }

  Future<void> uploadPhoto() async {
    executeFunctionWidthLoading(() async {
      await Future<void>.delayed(const Duration(seconds: 1));
      appRouterManager.goToNewRoute(AppRoute.home);
    });
  }

  Future<void> saveEntomologist() async {
    executeFunctionWidthLoading(() async {
      counterManager.initializeDefaultInsects();
      await entomologystViewModel.saveEntomologistToPreferences();
      appRouterManager.checkEntomologyst();
    });
  }

  Future<void> resetEntomologist() async {
    executeFunctionWidthLoading(() async {
      await entomologystViewModel.resetEntomologist();
      await appRouterManager.reInitializate();
    });
  }

  Future<void> executeFunctionWidthLoading(
    Future<void> Function() function,
  ) async {
    appRouterManager.setIsloading(true);
    await function();
    appRouterManager.setIsloading(false);
  }

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

  Future<void> newCounter() async {
    executeFunctionWidthLoading(() async {
      await Future<void>.delayed(const Duration(seconds: 1));
      await counterManager.initializeDefaultInsects();
      appRouterManager.goToNewRoute(AppRoute.newSpecieFormPage);
    });
  }

  Future<void> goToInsetcCounter() async {
    executeFunctionWidthLoading(() async {
      appRouterManager.goToNewRoute(AppRoute.counterPage);
    });
  }

  Future<void> saveCounter() async {
    executeFunctionWidthLoading(() async {
      goToRecords();
    });
  }

  Future<void> goToInfoPage() async {
    executeFunctionWidthLoading(() async {
      appRouterManager.goToNewRoute(AppRoute.infoPage);
    });
  }

  Future<void> goToRecords() async {
    executeFunctionWidthLoading(() async {
      appRouterManager.goToNewRoute(AppRoute.recordsPage);
    });
  }

  Future<void> goToDetailedCounterPage(
    ModelCountRecordViewModel countRecordViewModel,
  ) async {
    executeFunctionWidthLoading(() async {
      counterManager.setSelectedCounter(countRecordViewModel);
      appRouterManager.goToNewRoute(AppRoute.detailedCounterPage);
    });
  }

  void goToCounterPage(ModelCountRecordViewModel modelCountRecordViewModel) {
    executeFunctionWidthLoading(() async {
      counterManager.setSelectedCounter(modelCountRecordViewModel);
      appRouterManager.goToNewRoute(AppRoute.counterPage);
    });
  }
}
