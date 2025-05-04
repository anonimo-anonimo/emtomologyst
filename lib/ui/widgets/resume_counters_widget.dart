import 'package:flutter/material.dart';

import '../../viewmodels/counters_manager_view_model.dart';
import '../../viewmodels/model_count_record_view_model.dart';
import 'horizontal_mini_card_counter_widget.dart';

class ResumeCountersWidget extends StatelessWidget {
  const ResumeCountersWidget({required this.viewModel, super.key});

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
            HorizontalMiniCardCounterWidget(
              countRecordViewModel: countRecordViewModel,
            ),
          );
          children.add(const Divider());
        }
        children.removeLast();

        return ListView(children: children);
      },
    );
  }
}
