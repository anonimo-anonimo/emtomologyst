import 'package:flutter/material.dart';
import 'package:text_responsive/text_responsive.dart';

import '../../app_state_manager.dart';
import '../../viewmodels/counters_manager_view_model.dart';
import '../../viewmodels/model_count_record_view_model.dart';
import 'circle_counter_display_widget.dart';
import 'insect_rounded_photo_widget.dart';

class HorizontalMiniCardCounterWidget extends StatelessWidget {
  const HorizontalMiniCardCounterWidget({
    required this.countRecordViewModel,
    super.key,
  });

  final ModelCountRecordViewModel countRecordViewModel;

  @override
  Widget build(BuildContext context) {
    final AppStateManager appStateManager = AppStateManager.of(context);
    return MaterialButton(
      onPressed:
          () => appStateManager.goToDetailedCounterPage(countRecordViewModel),
      child: SizedBox(
        width: 360,
        height: 56,
        child: Row(
          children: <Widget>[
            const SizedBox(width: 8.0),
            CircleCounterDisplayWidget(
              radius: 20.0,
              label: countRecordViewModel.record.label,
              isLight: true,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: InlineTextWidget(countRecordViewModel.record.insectType),
            ),
            // Imagen de insecto
            InsectRoundedPhotoWidget(
              width: 50.0,
              modelInsect: CounterManagerViewModel.modelInsectFromModelRecord(
                countRecordViewModel.record,
              ),
            ),
            const SizedBox(width: 8.0),
          ],
        ),
      ),
    );
  }
}
