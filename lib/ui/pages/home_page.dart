import 'package:flutter/material.dart';

import '../../app_state_manager.dart';
import '../widgets/my_scaffold_widget.dart';
import '../widgets/new_counter_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppStateManager appStateManager = AppStateManager.of(context);
    return MyScaffoldWidget(
      child: Center(child: NewCounterWidget(appStateManager: appStateManager)),
    );
  }
}
