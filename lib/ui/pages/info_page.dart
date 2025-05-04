import 'package:flutter/material.dart';
import 'package:text_responsive/text_responsive.dart';

import '../../app_state_manager.dart';
import '../widgets/my_scaffold_widget.dart';
import '../widgets/resume_counters_widget.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppStateManager appStateManager = AppStateManager.of(context);
    return MyScaffoldWidget(
      child: Column(
        children: <Widget>[
          const SizedBox(width: 316.0, height: 55.0),
          Container(
            width: 364.0,
            height: 468.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28.0),
              color: Theme.of(context).highlightColor,
            ),
            child: Column(
              children: <Widget>[
                const SizedBox(width: 316.0, height: 16.0),
                const SizedBox(
                  width: 316.0,
                  height: 64.0,
                  child: InlineTextWidget(
                    'Tu resumen',
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
                Expanded(
                  child: ResumeCountersWidget(
                    viewModel: appStateManager.counterManager,
                  ),
                ),
                const SizedBox(width: 316.0, height: 16.0),
              ],
            ),
          ),

          const SizedBox(height: 225.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const OutlinedButton(
                onPressed: null,
                child: InlineTextWidget('Informes'),
              ),
              ElevatedButton(
                onPressed: appStateManager.goToRecords,
                child: const InlineTextWidget('Registros'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
