import 'package:flutter/material.dart';

import 'viewmodels/app_router_manager.dart';

class AppStateManager extends InheritedWidget {
  const AppStateManager({
    required super.child,
    required this.appRouterManager,
    super.key,
  });

  final AppRouterManager appRouterManager;

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
