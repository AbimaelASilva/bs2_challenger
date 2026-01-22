import 'package:bloc_test/bloc_test.dart';
import 'package:bus2/presentation/user_details/view/user_details_view.dart';
import 'package:bus2/presentation/user_details/viewmodel/user_details_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../fake_data.dart';
import '../../test_helper.dart';

class MockUserDetailsViewModel extends MockCubit<UserDetailsViewModelState>
    implements UserDetailsViewModel {}

void main() {
  late UserDetailsViewModel userDetailsViewModel;

  setUp(() {
    userDetailsViewModel = MockUserDetailsViewModel();
  });

  Widget createUserDetailsView(String userId) {
    return BlocProvider<UserDetailsViewModel>.value(
      value: userDetailsViewModel,
      child: createWidgetForTesting(UserDetailsView(userId: userId)),
    );
  }

  group('UserDetailsView Widget Tests', () {
    testWidgets('Should show user details when state has user',
        (WidgetTester tester) async {
      final user = createFakeUser(uuid: '123', first: 'Charlie');

      whenListen(
        userDetailsViewModel,
        Stream.fromIterable([
          UserDetailsViewModelState(
              user: user,),
        ]),
        initialState: UserDetailsViewModelState(
            user: user,),
      );

      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(createUserDetailsView('123'));
        await tester.pumpAndSettle();

        expect(find.text('Mr Charlie Doe'), findsOneWidget);

        // Use scrollUntilVisible to find location details
        await tester.scrollUntilVisible(
          find.text('New York'),
          500,
          scrollable: find.byType(Scrollable).first,
        );

        expect(find.text('New York'), findsOneWidget);
        expect(find.text('USA'), findsOneWidget);
      });
    });
  });
}
