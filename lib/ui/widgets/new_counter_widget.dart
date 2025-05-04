import 'package:flutter/material.dart';

import '../../app_state_manager.dart';

class NewCounterWidget extends StatelessWidget {
  const NewCounterWidget({required this.appStateManager, super.key});

  final AppStateManager appStateManager;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        width: 380.0,
        height: 80.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Icon(Icons.fiber_manual_record),
            const SizedBox(width: 215.0, child: Text('Nuevo conteo')),
            FloatingActionButton(
              onPressed: appStateManager.newCounter,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
