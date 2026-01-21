import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// An immutable set of radii for the corners of a rectangle.
///
/// Used by [BoxDecoration] when the shape is a [BoxShape.rectangle].
///
/// The [AppBorderRadius] class specifies offsets in terms of visual corners
/// This class use a border radius where all radii are [Radius.circular(radius)]
abstract class AppBorderRadius {
  /// No radius border
  static BorderRadius get none => BorderRadius.zero;

  /// Radius is 2
  static BorderRadius get sm => BorderRadius.circular(2);

  /// Radius is 4
  static BorderRadius get md => BorderRadius.circular(4);

  /// Radius is 8
  static BorderRadius get lg => BorderRadius.circular(8);

  /// Radius is 10
  static BorderRadius get xl => BorderRadius.circular(10);

  /// Radius is 15
  static BorderRadius get xm => BorderRadius.circular(15);

  /// Radius is 20
  static BorderRadius get po => BorderRadius.circular(20);

  /// Radius is 30
  static BorderRadius get pl => BorderRadius.circular(30);

  /// Radius is 300
  static BorderRadius get circle => BorderRadius.circular(300);
}
