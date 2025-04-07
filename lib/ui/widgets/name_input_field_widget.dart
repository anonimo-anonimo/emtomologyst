import 'package:flutter/material.dart';

import '../../viewmodels/entomologyst_view_model.dart';

class NameInputFieldWidget extends StatelessWidget {
  const NameInputFieldWidget({required this.viewModel, super.key});

  final EntomologystViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        // labelText: 'Nombre:',
        contentPadding: const EdgeInsets.only(left: 60.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Theme.of(context).canvasColor,
      ),
      onChanged: viewModel.updateName,
    );
  }
}
