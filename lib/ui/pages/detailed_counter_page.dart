import 'package:flutter/material.dart';
import 'package:text_responsive/text_responsive.dart';

import '../../app_state_manager.dart';
import '../widgets/horizontal_card_counter_widget.dart';
import '../widgets/map_widget.dart';
import '../widgets/my_scaffold_widget.dart';

class DetailedCounterPage extends StatelessWidget {
  const DetailedCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppStateManager appStateManager = AppStateManager.of(context);
    return MyScaffoldWidget(
      child: Column(
        children: <Widget>[
          Card(
            child: Center(
              child: Column(
                children: <Widget>[
                  HorizontalCardCounterWidget(
                    withBorder: false,
                    countRecordViewModel:
                        appStateManager.counterManager.selectedCounter,
                  ),
                  MapWidget(
                    record:
                        appStateManager.counterManager.selectedCounter.record,
                  ),
                  const SizedBox(height: 8.0),
                  SizedBox(
                    width: 360.0,
                    height: 150.0,
                    child: ParagraphTextWidget(
                      appStateManager
                          .counterManager
                          .selectedCounter
                          .record
                          .comment,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 225.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              OutlinedButton(
                onPressed: appStateManager.goToInfoPage,
                child: const InlineTextWidget('Informes'),
              ),
              ElevatedButton(
                onPressed: appStateManager.newCounter,
                child: const InlineTextWidget('Nuevo conteo'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
