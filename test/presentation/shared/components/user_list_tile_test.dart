import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:bus2/presentation/shared/shared.dart';
import '../../../test_helper.dart';

void main() {
  group('UserListTile Widget Tests', () {
    testWidgets('Should render name and location correctly',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          createWidgetForTesting(
            const UserListTile(
              name: 'John Doe',
              location: 'New York, USA',
              avatarUrl: 'https://example.com/avatar.jpg',
            ),
          ),
        );

        expect(find.text('John Doe'), findsOneWidget);
        expect(find.text('New York, USA'), findsOneWidget);
      });
    });

    testWidgets('Should call onTap when tapped', (WidgetTester tester) async {
      bool tapped = false;
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          createWidgetForTesting(
            UserListTile(
              name: 'Jane Doe',
              location: 'London, UK',
              avatarUrl: 'https://example.com/avatar.jpg',
              onTap: () => tapped = true,
            ),
          ),
        );

        await tester.tap(find.text('Jane Doe'));
        await tester.pumpAndSettle();

        expect(tapped, isTrue);
      });
    });
  });
}
