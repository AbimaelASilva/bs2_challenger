import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../core.dart';

abstract class AppNavigationBase {
  AppNavigationBase(this.context);
  final BuildContext context;
}

class AppNavigationGo extends AppNavigationBase {
  AppNavigationGo(super.context);

  void login() {
    context.go(AppRoutes.login);
  }

  void home() {
    context.go(AppRoutes.home);
  }
}

class AppNavigationPush extends AppNavigationBase {
  AppNavigationPush(super.context);

 
}

class AppNavigation {
  static AppNavigationGo of(BuildContext context) => AppNavigationGo(context);
  static AppNavigationPush to(BuildContext context) =>
      AppNavigationPush(context);
}
