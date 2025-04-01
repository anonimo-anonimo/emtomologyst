import 'package:flutter/material.dart';

import '../widgets/projector_widget.dart';

class MyPage extends StatelessWidget {
  const MyPage({this.page, super.key});

  final Widget? page;

  @override
  Widget build(BuildContext context) {
    const Color borderColor = Color(0x74777580);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      body: ProjectorWidget(
        page:
            page ??
            Center(
              child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor, width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                ),
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
    );
  }
}
