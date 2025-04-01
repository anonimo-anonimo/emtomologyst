import 'package:emtomologyst/ui/widgets/projector_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ProjectorWidget renders with preserved aspect ratio', (
    WidgetTester tester,
  ) async {
    const Key testKey = Key('TestChild');

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ProjectorWidget(
            page: ColoredBox(
              color: Colors.green,
              child: Center(child: Text('Test', key: testKey)),
            ),
          ),
        ),
      ),
    );

    final Finder childFinder = find.byKey(testKey);
    final Finder aspectRatioFinder = find.ancestor(
      of: childFinder,
      matching: find.byType(AspectRatio),
    );

    // Asegura que el widget objetivo fue renderizado
    expect(childFinder, findsOneWidget);

    // Asegura que está envuelto en un AspectRatio
    expect(aspectRatioFinder, findsOneWidget);

    // Asegura que el aspecto es cercano al de 412 / 892
    final AspectRatio aspectRatioWidget = tester.widget<AspectRatio>(
      aspectRatioFinder,
    );
    expect(aspectRatioWidget.aspectRatio, closeTo(412 / 892, 0.01));
  });
}
