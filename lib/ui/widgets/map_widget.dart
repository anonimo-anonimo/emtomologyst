import 'package:flutter/material.dart';

import '../../domain/models/model_count_record.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({required this.record, super.key});

  final ModelCountRecord record;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360.0,
      height: 204.0,
      child: Image.asset('assets/map.png'),
    );
  }
}
