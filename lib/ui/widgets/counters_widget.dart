import 'package:flutter/material.dart';

import '../../viewmodels/counters_manager_view_model.dart';
import '../../viewmodels/model_count_record_view_model.dart';
import 'horizontal_card_counter_widget.dart';

class CountersWidget extends StatelessWidget {
  const CountersWidget({required this.viewModel, super.key});

  final CounterManagerViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (_, __) {
        final List<Widget> children = <Widget>[];

        for (final ModelCountRecordViewModel countRecordViewModel
            in viewModel.counters.values) {
          children.add(
            HorizontalCardCounterWidget(
              countRecordViewModel: countRecordViewModel,
            ),
          );
        }

        return SizedBox(
          width: 362,
          height: 600.0,
          child: ListView(children: children),
        );
      },
    );
  }
}
