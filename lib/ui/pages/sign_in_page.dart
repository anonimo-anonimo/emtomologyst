import 'package:flutter/material.dart';
import 'package:text_responsive/text_responsive.dart';

import '../../app_state_manager.dart';
import '../../domain/models/model_entomologist.dart';
import '../widgets/name_input_field_widget.dart';
import '../widgets/profile_photo_widget.dart';
import '../widgets/share_user_location_widget.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppStateManager appStateManager = AppStateManager.of(context);

    final ModelEntomologist modelEntomologist =
        appStateManager.entomologystViewModel.entomologist;

    return Column(
      children: <Widget>[
        const SizedBox(height: 219.0),
        ProfilePhotoWidget(modelEntomologist: modelEntomologist),
        const SizedBox(height: 31.0),
        const SizedBox(
          width: 252.0,
          height: 24.0,
          child: InlineTextWidget('Nombre:'),
        ),
        SizedBox(
          width: 328.0,
          height: 56.0,
          child: NameInputFieldWidget(
            viewModel: appStateManager.entomologystViewModel,
          ),
        ),
        const SizedBox(height: 142.0),

        ShareUserLocationWidget(
          viewModel: appStateManager.geoLocationViewModel,
        ),

        const SizedBox(height: 89.0),
        SizedBox(
          width: 320.0,
          height: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              OutlinedButton(
                onPressed: appStateManager.saveEntomologist,
                child: const InlineTextWidget('Omitir'),
              ),
              ElevatedButton(
                onPressed: appStateManager.saveEntomologist,
                child: const InlineTextWidget('Guardar'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
