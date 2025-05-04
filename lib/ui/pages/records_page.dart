import 'package:flutter/material.dart';
import 'package:text_responsive/text_responsive.dart';

import '../../app_state_manager.dart';
import '../widgets/counters_widget.dart';
import '../widgets/my_scaffold_widget.dart';
import '../widgets/new_counter_widget.dart';

class RecordsPage extends StatelessWidget {
  const RecordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppStateManager appStateManager = AppStateManager.of(context);
    return MyScaffoldWidget(
      child: Column(
        children: <Widget>[
          NewCounterWidget(appStateManager: appStateManager),
          const SizedBox(height: 16.0),
          CountersWidget(viewModel: appStateManager.counterManager),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              OutlinedButton(
                onPressed: appStateManager.goToInfoPage,
                child: const InlineTextWidget('Informes'),
              ),
              const ElevatedButton(
                onPressed: null,
                child: InlineTextWidget('Registros'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
