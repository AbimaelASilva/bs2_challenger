import 'package:flutter/material.dart';


Widget createWidgetForTesting(Widget child) {
  return MaterialApp(
    home: Scaffold(
      body: child,
    ),
  );
}
