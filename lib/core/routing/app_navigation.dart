import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';

abstract class AppNavigationBase {
  AppNavigationBase(this.context);
  final BuildContext context;
}

class AppNavigationGo extends AppNavigationBase {
  AppNavigationGo(super.context);

  void home() {
    context.go(AppRoutes.home);
  }

  void savedUsers() {
    context.go(AppRoutes.saved);
  }

  void settings() {
    context.go(AppRoutes.settings);
  }
}

class AppNavigationPush extends AppNavigationBase {
  AppNavigationPush(super.context);

  Future<void> home() async {
    await context.push(AppRoutes.home);
  }

  Future<void> savedUsers() async {
    await context.push(AppRoutes.saved);
  }

  Future<void> userDetails(String uuid) async {
    await context.push('${AppRoutes.userDetails}/$uuid');
  }
}

class AppNavigation {
  static AppNavigationGo of(BuildContext context) => AppNavigationGo(context);
  static AppNavigationPush to(BuildContext context) =>
      AppNavigationPush(context);
}
