import 'package:flutter/material.dart';

import '../../domain/models/model_insect.dart';

class InsectRoundedPhotoWidget extends StatelessWidget {
  const InsectRoundedPhotoWidget({
    required this.modelInsect,
    this.width = 120.0,
    super.key,
  });

  // Aqui podria dejarse unicamente como un String para mayor flexibilidad 😊
  final ModelInsect modelInsect;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 3.0,
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
      ),

      child: Image(
        fit: BoxFit.fitWidth,
        errorBuilder:
            (BuildContext _, Object __, StackTrace? ___) =>
                const Center(child: CircularProgressIndicator()),
        image: AssetImage(modelInsect.urlPhoto),
      ),
    );
  }
}
