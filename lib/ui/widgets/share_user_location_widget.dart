import 'package:flutter/material.dart';
import 'package:text_responsive/text_responsive.dart';

import '../../viewmodels/geolocation_view_model.dart';

class ShareUserLocationWidget extends StatelessWidget {
  const ShareUserLocationWidget({
    required this.viewModel,

    this.width = 360.0,
    this.height = 88.0,

    super.key,
  });

  final GeoLocationViewModel viewModel;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ListTile(
        tileColor: Theme.of(context).canvasColor,
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
      ),
    );
  }
}
