import 'package:flutter/material.dart';

import '../../domain/models/model_entomologist.dart';

class ProfilePhotoWidget extends StatelessWidget {
  const ProfilePhotoWidget({
    required this.modelEntomologist,
    this.width = 120.0,
    super.key,
  });

  // Aqui podria dejarse unicamente como un String para mayor flexibilidad 😊
  final ModelEntomologist modelEntomologist;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width,
      decoration: const BoxDecoration(shape: BoxShape.circle),

      child: Image(
        fit: BoxFit.fitWidth,
        image:
            modelEntomologist.urlPhoto.contains('assets')
                ? AssetImage(modelEntomologist.urlPhoto)
                : NetworkImage(modelEntomologist.urlPhoto),
      ),
    );
  }
}
