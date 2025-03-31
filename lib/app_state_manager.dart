import 'package:flutter/material.dart';

class AppStateManager extends InheritedWidget {
  const AppStateManager({required super.child, super.key});

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
