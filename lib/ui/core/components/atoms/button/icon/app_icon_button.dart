import 'package:flutter/material.dart';

import '../../../../theme/theme_data_dark.dart';

/// Return iconButton
class AppIconButton extends StatefulWidget {
  /// The primary style
  factory AppIconButton.primary({
    required IconData icon,
    double? iconSize,
    Function? onPressed,
    double? size,
  }) {
    return AppIconButton._(
      icon: icon,
      backgroundColor: AppColor.primary.light,
      backgroundColorDisabled: AppColor.neutral.white,
      backgroundColorPressed: AppColor.primary.lighter,
      iconColor: AppColor.neutral.state,
      iconColorDisabled: AppColor.neutral.light,
      iconColorPressed: AppColor.primary.dark,
      iconSize: iconSize ?? 16,
      onPressed: onPressed,
      size: size,
      hasShadow: true,
    );
  }

  /// The second style
  factory AppIconButton.secondary({
    required IconData icon,
    double? iconSize,
    Function? onPressed,
    double? size,
    Color? iconColor,
  }) {
    return AppIconButton._(
      icon: icon,
      backgroundColor: Colors.transparent,
      backgroundColorDisabled: Colors.transparent,
      backgroundColorPressed: AppColor.neutral.light,
      iconColor: iconColor ?? AppColor.neutral.state,
      iconColorDisabled: AppColor.secondary.light,
      iconColorPressed: AppColor.primary.dark,
      iconSize: iconSize ?? 20,
      onPressed: onPressed,
      size: size,
      hasShadow: false,
    );
  }

  /// The custom style
  factory AppIconButton.custom({
    required IconData icon,
    double? iconSize,
    Function? onPressed,
    double? size,
    Color? backgroundColor,
    Color? backgroundColorDisabled,
    Color? backgroundColorPressed,
    Color? iconColor,
    Color? iconColorDisabled,
    Color? iconColorPressed,
    bool hasShadow = true,
    BoxShadow? boxShadow,
    BorderRadiusGeometry? borderRadius,
    Color? borderColor,
  }) {
    return AppIconButton._(
      icon: icon,
      backgroundColor: backgroundColor ?? Colors.transparent,
      backgroundColorDisabled: backgroundColorDisabled ?? Colors.transparent,
      backgroundColorPressed: backgroundColorPressed ?? AppColor.neutral.light,
      iconColor: iconColor ?? AppColor.primary.dark,
      iconColorDisabled: iconColorDisabled ?? AppColor.secondary.light,
      iconColorPressed: iconColorPressed ?? AppColor.primary.dark,
      iconSize: iconSize ?? 20,
      onPressed: onPressed,
      size: size,
      hasShadow: hasShadow,
      boxShadow: boxShadow,
      borderRadius: borderRadius,
      borderColor: borderColor,
    );
  }

  const AppIconButton._({
    required this.icon,
    required this.backgroundColor,
    required this.backgroundColorDisabled,
    required this.backgroundColorPressed,
    required this.iconColor,
    required this.iconColorDisabled,
    required this.iconColorPressed,
    required this.hasShadow,
    required this.size,
    this.iconSize,
    this.onPressed,
    this.boxShadow,
    this.borderRadius,
    this.borderColor,
  });

  /// button function. This parameter receive null value, the button
  /// will be disabled
  final Function? onPressed;

  ///
  final IconData icon;

  /// Icon size
  final double? iconSize;

  /// Button able background color
  final Color backgroundColor;

  /// Button pressed background color
  final Color backgroundColorPressed;

  /// Button disabled background color
  final Color backgroundColorDisabled;

  /// Button able icon color
  final Color iconColor;

  /// Button pressed icon pressed color
  final Color iconColorPressed;

  /// Button disabled icon disabled color
  final Color iconColorDisabled;

  ///
  final bool hasShadow;

  ///
  final double? size;

  ///
  final BoxShadow? boxShadow;

  final BorderRadiusGeometry? borderRadius;

  final Color? borderColor;

  @override
  State<StatefulWidget> createState() => _AppIconButtonState();
}

class _AppIconButtonState extends State<AppIconButton> {
  bool _isPressed = false;
  void _isPress(bool isPressed) {
    if (mounted) {
      setState(() {
        _isPressed = isPressed;
      });
      if (!isPressed) {
        widget.onPressed!.call();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.onPressed != null ? (_) => _isPress(true) : null,
      onTapUp: widget.onPressed != null ? (_) => _isPress(false) : null,
      child: Container(
        width: widget.size ?? 28,
        height: widget.size ?? 28,
        decoration: BoxDecoration(
          color: _getBackgroundColor,
          borderRadius: widget.borderRadius ?? AppBorderRadius.circle,
          border: widget.borderColor != null
              ? Border.all(color: widget.borderColor!)
              : null,
          boxShadow: widget.hasShadow
              ? [
                  widget.boxShadow ??
                      BoxShadow(
                        color: AppColor.neutral.dark,
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                        spreadRadius: -2,
                      ),
                ]
              : null,
        ),
        child: Center(
          child: Icon(widget.icon, color: _getIconColor, size: widget.iconSize),
        ),
      ),
    );
  }

  Color get _getBackgroundColor {
    if (widget.onPressed == null) {
      return widget.backgroundColorDisabled;
    } else if (_isPressed) {
      return widget.backgroundColorPressed;
    }
    return widget.backgroundColor;
  }

  Color? get _getIconColor {
    if (widget.onPressed == null) {
      return widget.iconColorDisabled;
    } else if (_isPressed) {
      return widget.iconColorPressed;
    }
    return widget.iconColor;
  }
}
