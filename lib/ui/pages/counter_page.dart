import 'package:flutter/material.dart';
import 'package:text_responsive/text_responsive.dart';

import '../../app_state_manager.dart';
import '../widgets/comment_input_field_widget.dart';
import '../widgets/counter_display_widget.dart';
import '../widgets/insect_counter_panel_widget.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppStateManager appStateManager = AppStateManager.of(context);
    return Column(
      children: <Widget>[
        const SizedBox(height: 213.0),
        ListenableBuilder(
          listenable: appStateManager.counterManager.selectedCounter,
          builder: (_, __) {
            return CounterDisplayWidget(
              label:
                  appStateManager.counterManager.selectedCounter.record.label,
            );
          },
        ),
        const SizedBox(height: 14.0),
        InsectCounterPanelWidget(
          counterManager: appStateManager.counterManager,
        ),
        const SizedBox(height: 42.0),
        CommentInputField(
          viewModel: appStateManager.counterManager.selectedCounter,
        ),
        const SizedBox(height: 118.0),
        ElevatedButton(
          onPressed: appStateManager.saveCounter,
          child: const InlineTextWidget('Guardar'),
        ),
      ],
    );
  }
}
