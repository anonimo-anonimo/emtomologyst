import 'package:flutter/material.dart';
import 'package:text_responsive/text_responsive.dart';

import '../../viewmodels/counters_manager_view_model.dart';
import 'insect_photo_widget.dart';

class InsectCounterPanelWidget extends StatelessWidget {
  const InsectCounterPanelWidget({required this.counterManager, super.key});

  final CounterManagerViewModel counterManager;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        width: 380.0,
        height: 80.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InsectPhotoWidget(
              width: 45.0,
              modelInsect: counterManager.modelInsectSelected,
            ),
            SizedBox(
              width: 215.0,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 160.0,
                    child: InlineTextWidget(
                      counterManager.modelInsectSelected.speciesName,
                    ),
                  ),
                  FloatingActionButton(
                    mini: true,
                    backgroundColor:
                        Theme.of(context).colorScheme.tertiaryContainer,
                    onPressed: counterManager.selectedCounter.decrementCount,
                    child: const Text('-'),
                  ),
                ],
              ),
            ),
            FloatingActionButton(
              onPressed: counterManager.selectedCounter.incrementCount,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
