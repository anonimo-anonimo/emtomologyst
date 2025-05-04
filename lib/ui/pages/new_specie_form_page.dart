import 'package:flutter/material.dart';
import 'package:text_responsive/text_responsive.dart';

import '../../app_state_manager.dart';
import '../../viewmodels/model_count_record_view_model.dart';
import '../widgets/insect_photo_widget.dart';
import '../widgets/my_scaffold_widget.dart';
import '../widgets/rounded_label_widget.dart';

class NewSpecieFormPage extends StatelessWidget {
  const NewSpecieFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppStateManager appStateManager = AppStateManager.of(context);
    return MyScaffoldWidget(
      child: Column(
        children: <Widget>[
          const SizedBox(height: 113.0),
          ListenableBuilder(
            listenable: appStateManager.counterManager,
            builder: (_, __) {
              return InsectPhotoWidget(
                modelInsect: appStateManager.counterManager.modelInsectSelected,
              );
            },
          ),
          const SizedBox(height: 79.0),
          ListenableBuilder(
            listenable: appStateManager.counterManager,
            builder: (_, __) {
              return SizedBox(
                height: 56.0,
                width: 200.0,
                child: DropdownButton<ModelCountRecordViewModel>(
                  value: appStateManager.counterManager.selectedCounter,
                  items:
                      appStateManager.counterManager.counters.values
                          .map(
                            (ModelCountRecordViewModel record) =>
                                DropdownMenuItem<ModelCountRecordViewModel>(
                                  value: record,
                                  child: Text(record.record.insectType),
                                ),
                          )
                          .toList(),
                  onChanged: (ModelCountRecordViewModel? value) {
                    if (value != null) {
                      appStateManager.counterManager.setSelectedCounter(value);
                    }
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 40.0),
          RoundedLabelWidget(
            title: 'Nombre especie',
            label:
                appStateManager.counterManager.modelInsectSelected.speciesName,
          ),
          RoundedLabelWidget(
            title: 'Nombre especie',
            label:
                appStateManager.counterManager.modelInsectSelected.moreInfoUrl,
          ),
          const SizedBox(height: 100.0),
          ElevatedButton(
            onPressed: appStateManager.goToInsetcCounter,
            child: const InlineTextWidget('Seleccionar'),
          ),
        ],
      ),
    );
  }
}
