import 'package:flutter/material.dart';
import '../../../../../../main_old.dart';

import '../../../../theme/theme_data_dark.dart';

/// Default button with several types:
class AppButton extends StatefulWidget {
  ///
  factory AppButton({
    Key? key,
    required String label,
    required Color backgroundColor,
    required Color backgroundColorPressed,
    required Color backgroundColorDisabled,
    required Color borderColor,
    required Color borderColorPressed,
    required Color borderColorDisabled,
    required TextStyle labelTextStyle,
    required TextStyle labelTextStylePressed,
    required TextStyle labelTextStyleDisabled,
    MainAxisAlignment? mainAxisAlignment,
    Function? onPressed,
    double? width,
    double? height,
    EdgeInsets? padding,
    IconData? icon,
    BorderRadius? borderRadius,
  }) {
    return AppButton._(
      key: key,
      label: label,
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      backgroundColorPressed: backgroundColorPressed,
      backgroundColorDisabled: backgroundColorDisabled,
      labelTextStyle: labelTextStyle,
      borderColor: borderColor,
      borderColorPressed: borderColorPressed,
      borderColorDisabled: borderColorDisabled,
      labelTextStylePressed: labelTextStylePressed,
      labelTextStyleDisabled: labelTextStyleDisabled,
      mainAxisAlignment: mainAxisAlignment,
      width: width,
      height: height,
      padding: padding,
      icon: icon,
      borderRadius: borderRadius,
    );
  }

  ///
  factory AppButton.primary({
    required String label,
    Function? onPressed,
    double? width,
    double? height,
    IconData? icon,
    BorderRadius? borderRadius,
    EdgeInsets? padding,
    EdgeInsets? iconPadding,
    Color? backgroundColor,
    Color? borderColor,
  }) {
    final isDark = Theme.of(navigatorKey.currentState!.context).brightness ==
        Brightness.dark;

    final backgroundColorAux = backgroundColor ??
        (isDark ? const Color(0xFF1F1F1F) : AppColor.neutral.white);

    return AppButton._(
      label: label,
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      backgroundColorPressed: backgroundColorAux,
      backgroundColorDisabled: isDark
          ? AppColor.neutral.white
          : AppColor.neutral.smoke, // AppColor.neutral.smoke,
      labelTextStyle: AppTypografy.buttonPrimary.copyWith(
        color: isDark ? AppColor.neutral.white : AppColor.neutral.dark,
      ),
      padding: padding ?? EdgeInsets.zero,
      iconPadding: iconPadding ?? const EdgeInsets.only(right: AppSpacing.xxxs),
      labelTextStylePressed: AppTypografy.buttonPrimary.copyWith(
        color: isDark ? AppColor.neutral.white : AppColor.primary.dark,
      ),
      labelTextStyleDisabled: AppTypografy.buttonPrimary.copyWith(
        color: isDark ? AppColor.neutral.white : AppColor.neutral.state,
      ),
      borderColor: borderColor ?? AppColor.primary.dark,
      borderColorPressed: AppColor.primary.dark,
      borderColorDisabled: AppColor.neutral.light,
      width: width,
      height: height,
      icon: icon,
      borderRadius: borderRadius,
    );
  }

  ///
  factory AppButton.secondary({
    required String label,
    Function? onPressed,
    double? width,
    double? height,
    IconData? icon,
    BorderRadius? borderRadius,
    Color? borderColor,
    EdgeInsets? padding,
  }) {
    return AppButton._(
      label: label,
      padding: padding,
      onPressed: onPressed,
      backgroundColor: Colors.transparent,
      backgroundColorPressed: Colors.transparent,
      backgroundColorDisabled: Colors.transparent,
      labelTextStyle: AppTypografy.buttonSecondary,
      labelTextStylePressed: AppTypografy.buttonSecondary,
      labelTextStyleDisabled: AppTypografy.buttonSecondary,
      borderColor: borderColor ?? AppColor.primary.dark,
      borderColorPressed: borderColor ?? AppColor.primary.dark,
      borderColorDisabled: AppColor.neutral.smoke,
      width: width,
      height: height,
      icon: icon,
      borderRadius: borderRadius,
    );
  }

  ///
  factory AppButton.tertiary({
    required String label,
    Function? onPressed,
    double? width,
    double? height,
    IconData? icon,
    BorderRadius? borderRadius,
    Color? labelColor,
    MainAxisAlignment? mainAxisAlignment,
    Key? key,
  }) {
    return AppButton._(
      key: key,
      label: label,
      onPressed: onPressed,
      backgroundColor: Colors.transparent,
      backgroundColorPressed: Colors.transparent,
      backgroundColorDisabled: Colors.transparent,
      labelTextStyle: AppTypografy.buttonTertiary.copyWith(
        color: labelColor ?? AppColor.primary.dark,
        height: 1,
      ),
      labelTextStylePressed: AppTypografy.buttonTertiary.copyWith(
        color: AppColor.primary.medium,
        height: 1,
      ),
      labelTextStyleDisabled: AppTypografy.buttonTertiary.copyWith(
        color: AppColor.neutral.smoke,
        height: 1,
      ),
      borderColor: Colors.transparent,
      borderColorPressed: Colors.transparent,
      borderColorDisabled: Colors.transparent,
      width: width,
      height: height,
      icon: icon,
      borderRadius: borderRadius,
      mainAxisAlignment: mainAxisAlignment,
    );
  }

  /// [AppButton] constructor
  const AppButton._({
    super.key,
    required this.label,
    required this.onPressed,
    required this.backgroundColor,
    required this.backgroundColorPressed,
    required this.backgroundColorDisabled,
    required this.labelTextStyle,
    required this.borderColor,
    required this.borderColorPressed,
    required this.borderColorDisabled,
    required this.labelTextStylePressed,
    required this.labelTextStyleDisabled,
    this.mainAxisAlignment,
    this.width,
    this.height,
    this.padding,
    this.iconPadding,
    this.icon,
    this.borderRadius,
  });

  /// Button label
  final String label;

  /// button text style
  final TextStyle labelTextStyle;

  /// button text style pressed
  final TextStyle labelTextStylePressed;

  /// button text style disable
  final TextStyle labelTextStyleDisabled;

  /// button function. This parameter receive null value, the button
  /// will be disabled
  final Function? onPressed;

  /// button width with [double.maxFinite] value default
  final double? width;

  /// button height with 56 value default
  final double? height;

  /// button padding with [AppSpacing.xxs] value default
  final EdgeInsets? padding;

  /// button padding with [AppSpacing.xxxs] value default
  final EdgeInsets? iconPadding;

  /// Button able background color
  final Color? backgroundColor;

  /// Button pressed background color
  final Color backgroundColorPressed;

  /// Button disabled background color
  final Color backgroundColorDisabled;

  /// Button able color border
  final Color borderColor;

  /// Button pressed color border
  final Color borderColorPressed;

  /// Button disabled color border
  final Color borderColorDisabled;

  ///
  final IconData? icon;

  /// Alignment axis. [MainAxisAlignment.center] is value default
  final MainAxisAlignment? mainAxisAlignment;

  /// The radius used in border of button.
  ///
  /// The default value is [AppBorderRadius.lg].
  final BorderRadius? borderRadius;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool get isDark =>
      Theme.of(navigatorKey.currentState!.context).brightness ==
      Brightness.dark;

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
        padding: widget.padding,
        height: widget.height ?? 56,
        width: widget.width,
        decoration: BoxDecoration(
          color: _getBackgroundColor,
          borderRadius: widget.borderRadius ?? AppBorderRadius.pl,
          border: AppBorderWidths.hairline(
            color: _borderColor,
          ),
        ),
        child: Row(
          mainAxisAlignment:
              widget.mainAxisAlignment ?? MainAxisAlignment.center,
          children: [
            _icon,
            Text(
              widget.label,
              style: _getLabelTextStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget get _icon => widget.icon != null
      ? Container(
          padding: widget.iconPadding ??
              const EdgeInsets.only(
                right: AppSpacing.xxxs,
              ),
          child: Icon(widget.icon, color: _getIconColor, size: 22),
        )
      : Container();

  Color? get _getBackgroundColor {
    if (widget.onPressed == null) {
      return isDark ? AppColor.neutral.muted : widget.backgroundColorDisabled;
    } else if (_isPressed) {
      return widget.backgroundColorPressed;
    }
    return widget.backgroundColor;
  }

  Color? get _getIconColor {
    if (widget.onPressed == null) {
      return widget.labelTextStyleDisabled.color;
    } else if (_isPressed) {
      return widget.labelTextStylePressed.color;
    }
    return widget.labelTextStyle.color;
  }

  Color get _borderColor {
    if (widget.onPressed == null) {
      return widget.borderColorDisabled;
    } else if (_isPressed) {
      return widget.borderColorPressed;
    }
    return widget.borderColor;
  }

  TextStyle get _getLabelTextStyle {
    if (widget.onPressed == null) {
      return widget.labelTextStyleDisabled;
    } else if (_isPressed) {
      return widget.labelTextStylePressed;
    }
    return widget.labelTextStyle;
  }
}
