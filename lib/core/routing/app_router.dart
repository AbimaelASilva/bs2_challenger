import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/presentation.dart';
import 'app_routes.dart';

class AppRouter {
  static GoRouter createRouter(GetIt getIt) {
    return GoRouter(
      initialLocation: AppRoutes.home,
      routes: [
        GoRoute(
          path: AppRoutes.home,
          name: AppRoutes.home,
          builder: (context, state) => BlocProvider(
            create: (context) => getIt<HomeViewModel>()..getRandonUser(),
            child: const HomeView(),
          ),
        ),
      ],
    );
  }
}
