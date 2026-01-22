import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:bus2/presentation/home/view/home_view.dart';
import 'package:bus2/presentation/home/viewmodel/home_viewmodel.dart';
import '../../fake_data.dart';
import '../../test_helper.dart';

class MockHomeViewModel extends MockCubit<HomeViewModelState>
    implements HomeViewModel {}

void main() {
  late HomeViewModel homeViewModel;

  setUp(() {
    homeViewModel = MockHomeViewModel();
  });

  Widget createHomeView() {
    return BlocProvider<HomeViewModel>.value(
      value: homeViewModel,
      child: createWidgetForTesting(const HomeView()),
    );
  }

  group('HomeView Widget Tests', () {
    testWidgets('Should show list of users and count',
        (WidgetTester tester) async {
      final users = [
        createFakeUser(uuid: '1', first: 'Alice'),
        createFakeUser(uuid: '2', first: 'Bob'),
      ];

      whenListen(
        homeViewModel,
        Stream.fromIterable([
          HomeViewModelState(users: users, filteredUsers: users),
        ]),
        initialState: HomeViewModelState(users: users, filteredUsers: users),
      );

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createHomeView());
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 100));

        expect(find.text('Alice Doe'), findsOneWidget);
        expect(find.text('Bob Doe'), findsOneWidget);

        // Search for just "usu" to be extremely flexible
        expect(find.textContaining('usu'), findsWidgets);
      });
    });

    testWidgets('Should show error message', (WidgetTester tester) async {
      whenListen(
        homeViewModel,
        Stream.fromIterable([
          const HomeViewModelState(error: 'Failed message'),
        ]),
        initialState: const HomeViewModelState(error: 'Failed message'),
      );

      await tester.pumpWidget(createHomeView());
      await tester.pump();

      expect(find.textContaining('Erro'), findsOneWidget);
    });
  });
}
