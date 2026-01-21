import 'package:flutter/material.dart';

import '../../../theme/theme_data_dark.dart';

/// Return Search Input
class AppSearchInput extends StatelessWidget {
  /// Generic AppSearchInput constructor
  factory AppSearchInput({
    Key? key,
    required String hint,
    required void Function(String) onChanged,
    required bool enabled,
    Widget? suffixIcon,
    Widget? prefixIcon,
    Color? backgroundColor,
    FocusNode? focusNode,
    VoidCallback? onPressed,
    String? initialValue,
    EdgeInsetsGeometry? contentPadding,
  }) {
    return AppSearchInput._(
      key: key,
      hint: hint,
      onChanged: onChanged,
      enabled: enabled,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      backgroundColor: backgroundColor,
      focusNode: focusNode,
      onPressed: onPressed,
      initialValue: initialValue,
      contentPadding: contentPadding,
    );
  }

  /// Constructor for search input general
  factory AppSearchInput.general({
    required String hint,
    void Function(String)? onChanged,
    bool enabled = true,
    Color? backgroundColor,
    FocusNode? focusNode,
    VoidCallback? onPressed,
    void Function(String)? onSubmitted,
    String? initialValue,
  }) {
    return AppSearchInput._(
      hint: hint,
      onChanged: onChanged,
      enabled: enabled,
      backgroundColor: backgroundColor,
      focusNode: focusNode,
      onPressed: onPressed,
      onSubmitted: onSubmitted,
      prefixIcon: IconButton(
        onPressed: onPressed,
        iconSize: 22,
        icon: Icon(
          Icons.arrow_back,
          color: AppColor.primary.dark,
        ),
        enableFeedback: false,
        splashColor: Colors.transparent,
      ),
      initialValue: initialValue,
    );
  }

  /// [AppSearchInput] private constructor
  const AppSearchInput._({
    super.key,
    required this.hint,
    required this.onChanged,
    required this.enabled,
    this.suffixIcon,
    this.prefixIcon,
    this.backgroundColor,
    this.focusNode,
    this.onPressed,
    this.onSubmitted,
    this.initialValue,
    this.contentPadding,
  });

  /// This widget is circunded for gesture detector
  /// and callback is onTapPrefix
  final Widget? suffixIcon;

  /// This widget is circunded for gesture detector
  /// and callback is onTapPrefix
  final Widget? prefixIcon;

  ///
  final String hint;

  /// Field enabled. Default is true
  final bool enabled;

  /// Function for change
  final void Function(String)? onChanged;

  /// Background color
  final Color? backgroundColor;

  /// Focus node
  final FocusNode? focusNode;

  /// Function to back button
  final VoidCallback? onPressed;

  /// Function to submitted
  final void Function(String)? onSubmitted;

  ///
  final String? initialValue;

  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextFormField(
          enabled: enabled,
          focusNode: focusNode,
          onChanged: onChanged,
          initialValue: initialValue,
          style: AppTypografy.bodyRegular.copyWith(
            color: enabled ? AppColor.primary.dark : AppColor.neutral.light,
          ),
          onFieldSubmitted: onSubmitted,
          decoration: InputDecoration(
            contentPadding: contentPadding,
            isDense: true,
            filled: true,
            hintText: hint,
            hintStyle: AppTypografy.bodyRegular.copyWith(
              color: AppColor.neutral.muted,
            ),
            fillColor: backgroundColor ?? Colors.transparent,
            border: OutlineInputBorder(
              borderRadius: AppBorderRadius.lg,
              borderSide: BorderSide(
                color: AppColor.neutral.muted,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: AppBorderRadius.lg,
              borderSide: BorderSide(color: AppColor.neutral.dark),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: AppBorderRadius.lg,
              borderSide: BorderSide(
                color: AppColor.secondary.light,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: AppBorderRadius.lg,
              borderSide: BorderSide(
                color: AppColor.primary.dark,
              ),
            ),
            suffixIcon: suffixIcon ??
                Icon(
                  Icons.search,
                  size: 22,
                  color:
                      enabled ? AppColor.primary.dark : AppColor.neutral.light,
                ),
            prefixIcon: prefixIcon,
          ),
        ),
      ],
    );
  }
}
