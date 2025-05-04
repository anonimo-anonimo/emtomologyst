import 'package:flutter/material.dart';

import '../../app_state_manager.dart';
import 'profile_photo_widget.dart';

class ReactiveProfileWidget extends StatelessWidget {
  const ReactiveProfileWidget({required this.appStateManager, super.key});

  final AppStateManager appStateManager;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListenableBuilder(
        listenable: appStateManager.entomologystViewModel,
        builder: (_, __) {
          return MaterialButton(
            onPressed: appStateManager.updateProfile,
            child: ProfilePhotoWidget(
              width: 65.0,
              modelEntomologist:
                  appStateManager.entomologystViewModel.entomologist,
            ),
          );
        },
      ),
    );
  }
}
