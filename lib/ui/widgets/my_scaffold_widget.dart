import 'package:flutter/material.dart';

import '../../app_state_manager.dart';
import 'reactive_profile_widget.dart';

class MyScaffoldWidget extends StatelessWidget {
  const MyScaffoldWidget({required this.child, super.key});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    final AppStateManager appStateManager = AppStateManager.of(context);

    return Stack(
      children: <Widget>[
        Positioned(
          top: 10.0,
          left: 35.0,
          child: ReactiveProfileWidget(appStateManager: appStateManager),
        ),
        Positioned(
          top: 85.0,
          left: 8.0,
          child: SizedBox(width: 402.0, height: 841.0, child: child),
        ),
      ],
    );
  }
}
