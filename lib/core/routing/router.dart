import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../main_old.dart';
import '../../ui/ui.dart';
import 'routes.dart';

GoRouter appRouter(GetIt getIt, {bool debug = false}) => GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: AppRoutes.home,
      debugLogDiagnostics: debug,
      routes: [
        GoRoute(
          path: AppRoutes.home,
          builder: (context, state) => HomePage(controller: getIt.get()),
        ),
        GoRoute(
          path: AppRoutes.login,
          builder: (context, state) {
            return LoginPage(controller: getIt.get());
          },
        ),
      ],
    );
