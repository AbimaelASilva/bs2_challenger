import 'package:bloc_test/bloc_test.dart';
import 'package:bus2/presentation/saved/view/saved_view.dart';
import 'package:bus2/presentation/saved/viewmodel/saved_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../fake_data.dart';
import '../../test_helper.dart';

class MockSavedViewModel extends MockCubit<SavedViewModelState>
    implements SavedViewModel {}

void main() {
  late SavedViewModel savedViewModel;

  setUp(() {
    savedViewModel = MockSavedViewModel();
    // Register mock in GetIt because SavedUserView uses GetIt.I<SavedViewModel>()
    final getIt = GetIt.instance;
    if (getIt.isRegistered<SavedViewModel>()) {
      getIt.unregister<SavedViewModel>();
    }
    getIt.registerSingleton<SavedViewModel>(savedViewModel);
  });

  tearDown(() {
    GetIt.instance.unregister<SavedViewModel>();
  });

  Widget createSavedUserView() {
    return createWidgetForTesting(const SavedUserView());
  }

  group('SavedUserView Widget Tests', () {
    testWidgets('Should show empty state when list is empty',
        (WidgetTester tester) async {
      whenListen(
        savedViewModel,
        Stream.fromIterable([
          const SavedViewModelState(),
        ]),
        initialState: const SavedViewModelState(),
      );

      await tester.pumpWidget(createSavedUserView());
      await tester.pump();

      expect(find.text('Nenhum usuário salvo'), findsOneWidget);
    });

    testWidgets('Should show list of saved users', (WidgetTester tester) async {
      final users = [
        createFakeUser(uuid: '1', first: 'Alice'),
      ];

      whenListen(
        savedViewModel,
        Stream.fromIterable([
          SavedViewModelState(users: users),
        ]),
        initialState: SavedViewModelState(users: users),
      );

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createSavedUserView());
        await tester.pumpAndSettle();

        expect(find.textContaining('Alice'), findsOneWidget);
      });
    });

    testWidgets('Should show delete confirmation dialog',
        (WidgetTester tester) async {
      final users = [createFakeUser(uuid: '1', first: 'Alice')];

      whenListen(
        savedViewModel,
        Stream.fromIterable([
          SavedViewModelState(users: users),
        ]),
        initialState: SavedViewModelState(users: users),
      );

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createSavedUserView());
        await tester.pumpAndSettle();

        final deleteIcon = find.byIcon(Icons.delete_outline);
        await tester.tap(deleteIcon);
        await tester.pumpAndSettle();

        expect(find.text('Remover usuário'), findsOneWidget);
        expect(find.textContaining('remover este usuário'), findsOneWidget);
      });
    });
  });
}
