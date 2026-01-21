import 'package:flutter/material.dart';

import '../color/app_color.dart';

/// [AppBorderWidths] is [BoxBorder] width Border.all
abstract class AppBorderWidths {
  /// Width 0.0
  static BoxBorder none() => Border.all(
        width: 0,
        color: Colors.transparent,
        style: BorderStyle.none,
      );

  /// Width is 1.0
  static BoxBorder hairline({Color? color}) =>
      Border.all(color: color ?? AppColor.neutral.snow);

  /// Width is 2.0
  static BoxBorder thin({Color? color}) =>
      Border.all(color: color ?? AppColor.neutral.snow, width: 2);

  /// Width is 4.0
  static BoxBorder thick({Color? color}) =>
      Border.all(color: color ?? AppColor.neutral.snow, width: 4);

  /// Width is 8.0
  static BoxBorder heavy({Color? color}) =>
      Border.all(color: color ?? AppColor.neutral.snow, width: 8);
}
