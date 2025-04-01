import 'package:flutter/material.dart';

import 'widgets/projector_widget.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ProjectorWidget(
          page: Center(
            child: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              color: Colors.green,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final double screenWidth = constraints.maxWidth;
                  final double screenHeight = constraints.maxHeight;
                  return Text(
                    'Hello World!\n${MediaQuery.of(context).size}\nContenedor:$screenWidth x $screenHeight',
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
