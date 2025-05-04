import 'package:flutter/material.dart';

import '../../viewmodels/model_count_record_view_model.dart';

class CommentInputField extends StatefulWidget {
  const CommentInputField({required this.viewModel, super.key});

  final ModelCountRecordViewModel viewModel;

  @override
  State<CommentInputField> createState() => _CommentInputFieldState();
}

class _CommentInputFieldState extends State<CommentInputField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final String initialComment =
        widget.viewModel.record.comment != '|URL'
            ? widget.viewModel.record.comment
            : '';
    _controller = TextEditingController(text: initialComment);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 344.0,
      height: 184.0,
      child: TextField(
        controller: _controller,
        maxLines: null,
        expands: true,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          hintText: 'Agregar comentario',
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: widget.viewModel.updateComment,
      ),
    );
  }
}
