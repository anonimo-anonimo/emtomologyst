import 'package:flutter/material.dart';
import 'package:text_responsive/text_responsive.dart';

import '../../app_state_manager.dart';
import '../widgets/profile_photo_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppStateManager appStateManager = AppStateManager.of(context);
    return Column(
      children: <Widget>[
        const SizedBox(height: 219.0),
        ProfilePhotoWidget(
          modelEntomologist: appStateManager.entomologystViewModel.entomologist,
        ),
        const SizedBox(height: 80.0),
        ElevatedButton(
          onPressed: appStateManager.uploadPhoto,
          child: const InlineTextWidget('Subir foto de perfil'),
        ),
      ],
    );
  }
}
