import 'package:flutter/material.dart';
import 'package:text_responsive/text_responsive.dart';

import '../../viewmodels/geolocation_view_model.dart';

class ShareUserLocationWidget extends StatelessWidget {
  const ShareUserLocationWidget({required this.viewModel, super.key});

  final GeoLocationViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ListenableBuilder(
        listenable: viewModel,
        builder: (_, __) {
          return Switch(
            value: viewModel.hasLocationPermission,
            onChanged: viewModel.setUserLocationPermission,
          );
        },
      ),
      title: InlineTextWidget(
        'Compartenos tu ubicación',
        style: Theme.of(
          context,
        ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400),
      ),
      subtitle: const ParagraphTextWidget(
        'Deja que entomology conozca tu ubicación para gestionar tus registros. ',
      ),
    );
  }
}
