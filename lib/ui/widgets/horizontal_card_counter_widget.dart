import 'package:flutter/material.dart';
import 'package:text_responsive/text_responsive.dart';

import '../../app_state_manager.dart';
import '../../viewmodels/counters_manager_view_model.dart';
import '../../viewmodels/model_count_record_view_model.dart';
import 'circle_counter_display_widget.dart';
import 'insect_photo_widget.dart';

class HorizontalCardCounterWidget extends StatelessWidget {
  const HorizontalCardCounterWidget({
    required this.countRecordViewModel,
    this.withBorder = true,
    super.key,
  });
  final ModelCountRecordViewModel countRecordViewModel;
  final bool withBorder;
  @override
  Widget build(BuildContext context) {
    final AppStateManager appStateManager = AppStateManager.of(context);
    return SizedBox(
      width: 360,
      height: 80,
      child: Card(
        elevation: withBorder ? null : 0.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: MaterialButton(
          onPressed:
              () => appStateManager.goToCounterPage(countRecordViewModel),
          child: Row(
            children: <Widget>[
              const SizedBox(width: 8),
              CircleCounterDisplayWidget(
                label: countRecordViewModel.record.label,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InlineTextWidget(
                      countRecordViewModel.record.insectType,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    InlineTextWidget(
                      'Ciudad: ${countRecordViewModel.record.geolocation}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              // Imagen de insecto
              InsectPhotoWidget(
                width: 80.0,
                modelInsect: CounterManagerViewModel.modelInsectFromModelRecord(
                  countRecordViewModel.record,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
