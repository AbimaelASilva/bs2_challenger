import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Um helper para envolver widgets em um MaterialApp para testes.
Widget createWidgetForTesting(Widget child) {
  return MaterialApp(
    home: Scaffold(
      body: child,
    ),
  );
}
