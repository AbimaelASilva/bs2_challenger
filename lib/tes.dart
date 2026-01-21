import 'dart:ui';

import 'package:flutter/widgets.dart';

class ThemeBridge extends InheritedWidget {
  final Brightness brightness;

  const ThemeBridge({
    super.key,
    required this.brightness,
    required super.child,
  });

  static ThemeBridge of(BuildContext context) {
    final ThemeBridge? result =
        context.dependOnInheritedWidgetOfExactType<ThemeBridge>();
    assert(result != null, 'No ThemeBridge found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ThemeBridge oldWidget) {
    return brightness != oldWidget.brightness;
  }
}
