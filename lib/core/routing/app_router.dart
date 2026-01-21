import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../domain/domain.dart';
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
            create: (context) => getIt<HomeViewModel>()..startPeriodicRequest(),
            child: const HomeView(),
          ),
        ),
        GoRoute(
          path: AppRoutes.saved,
          name: AppRoutes.saved,
          builder: (context, state) => BlocProvider(
            create: (context) => getIt<SavedViewModel>(),
            child: const SavedView(),
          ),
        ),
        GoRoute(
          path: '${AppRoutes.userDetails}/:userId',
          name: AppRoutes.userDetails,
          builder: (context, state) {
            final userId = state.pathParameters['userId'] ?? '';
            return BlocProvider(
              create: (context) => getIt<UserDetailsViewModel>(
                param1: getIt<IUserRepository>(),
                param2: userId,
              ),
              child: UserDetailsView(userId: userId),
            );
          },
        ),
      ],
    );
  }
}
