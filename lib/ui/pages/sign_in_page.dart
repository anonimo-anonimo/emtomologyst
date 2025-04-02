import 'package:flutter/material.dart';
import 'package:text_responsive/text_responsive.dart';

import '../../app_state_manager.dart';
import '../../domain/models/model_entomologist.dart';

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
        Image(
          image: NetworkImage(modelEntomologist.urlPhoto),
          width: 120.0,
          height: 120.0,
        ),
        const SizedBox(height: 31.0),
        Container(
          color: Colors.white,
          width: 252.0,
          height: 24.0,
          child: const InlineTextWidget('Nombre:'),
        ),
        Container(
          color: Colors.white,
          width: 358.0,
          height: 56.0,
          child: const InlineTextWidget('Aqui ira el input 😊:'),
        ),
        const SizedBox(height: 142.0),
        Container(
          color: Colors.white,
          width: 360.0,
          height: 88.0,
          child: const ParagraphTextWidget('Aqui va el texto de la cajita 😊:'),
        ),
        const SizedBox(height: 89.0),
        Container(
          color: Colors.white,
          width: 320.0,
          height: 40.0,
          child: const ParagraphTextWidget('Aqui van los botones 😊:'),
        ),
      ],
    );
  }
}
