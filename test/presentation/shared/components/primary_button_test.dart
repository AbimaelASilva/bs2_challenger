import 'package:bus2/presentation/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_helper.dart';

void main() {
  group('PrimaryButton Widget Tests', () {
    testWidgets('Should render label correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        createWidgetForTesting(
          PrimaryButton(
            label: 'Test Button',
            onPressed: () {},
          ),
        ),
      );

      expect(find.text('Test Button'), findsOneWidget);
    });

    testWidgets('Should show icon when provided', (WidgetTester tester) async {
      await tester.pumpWidget(
        createWidgetForTesting(
          PrimaryButton(
            label: 'Button with Icon',
            icon: Icons.add,
            onPressed: () {},
          ),
        ),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('Should call onPressed when tapped',
        (WidgetTester tester) async {
      bool pressed = false;
      await tester.pumpWidget(
        createWidgetForTesting(
          PrimaryButton(
            label: 'Tap Me',
            onPressed: () => pressed = true,
          ),
        ),
      );

      await tester.tap(find.text('Tap Me'));
      await tester.pumpAndSettle();

      expect(pressed, isTrue);
    });
  });
}
