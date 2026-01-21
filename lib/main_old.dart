import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'bootstrap.dart';
import 'core/core.dart';
import 'core/routing/router.dart';
import 'ui/core/localization/localization.dart';
import 'ui/core/theme/theme_controller.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  await bootstrap(
    (showLog, getIt) => AppDemo(showLog: showLog, getIt: getIt),
  );
  //
}

class AppDemo extends StatefulWidget {
  const AppDemo({super.key, required this.showLog, required this.getIt});
  final bool showLog;
  final GetIt getIt;

  @override
  State<AppDemo> createState() => _AppDemoState();
}

class _AppDemoState extends State<AppDemo> {
  late final GoRouter router;

  @override
  void initState() {
    super.initState();
    router = appRouter(widget.getIt, debug: widget.showLog);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeController.instance.themeModeNotifier,
      builder: (context, mode, _) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'AppDemo',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: mode,
          routerConfig: router,
          localizationsDelegates: context.localizationsDelegates,
          supportedLocales: context.supportedLocales,
        );
      },
    );
  }
}
