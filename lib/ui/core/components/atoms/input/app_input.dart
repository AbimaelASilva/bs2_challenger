import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../theme/theme_data_dark.dart';
import 'app_input_formatter.dart';
import 'app_masked.dart';

/// Return input
class AppInput extends StatefulWidget {
  /// Generic constructor
  factory AppInput({
    Key? key,
    required String error,
    required String label,
    required void Function(String) onChanged,
    required String helpText,
    required bool enabled,
    required bool isPassword,
    required TextInputType inputType,
    String labelAbove = '',
    String? hint,
    Widget? sufixIcon,
    String? initialValue,
    List<TextInputFormatter>? inputFormmatters,
    AppMasked? mask,
    Color? backgroundColor,
    int? maxLines,
    int? maxLength,
    FocusNode? focusNode,
  }) {
    return AppInput._(
      key: key,
      error: error,
      label: label,
      hint: hint ?? label,
      onChanged: onChanged,
      helpText: helpText,
      enabled: enabled,
      isPassword: isPassword,
      inputType: inputType,
      sufixIcon: sufixIcon,
      initialValue: initialValue,
      inputFormmatters: inputFormmatters,
      mask: mask,
      backgroundColor: backgroundColor,
      maxLength: maxLength,
      maxLines: maxLines,
      focusNode: focusNode,
      labelAbove: labelAbove,
    );
  }

  /// Constructor for input general
  factory AppInput.general({
    Key? key,
    String error = '',
    String? label = '',
    String labelAbove = '',
    required void Function(String) onChanged,
    List<TextInputFormatter>? inputFormmatters,
    TextInputType inputType = TextInputType.text,
    AppMasked? mask,
    String? hint = '',
    String? initialValue,
    bool enabled = true,
    String helpText = '',
    Color? backgroundColor,
    Widget? sufixIcon,
    void Function(bool)? hasFocus,
    int? maxLength,
    FocusNode? focusNode,
    int? maxLines,
    TextAlign? textAlign,
    TextCapitalization textCapitalization = TextCapitalization.none,
    bool? alignLabelWithHint = false,
    String? prefixText,
    String? hintFocus,
    double? fontSize,
    FontWeight? fontWeight,
    bool showMandatorySign = false,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return AppInput._(
      key: key,
      error: error,
      label: label,
      hint: hint ?? label,
      onChanged: onChanged,
      initialValue: initialValue,
      enabled: enabled,
      inputType: inputType,
      inputFormmatters: inputFormmatters,
      helpText: helpText,
      isPassword: false,
      mask: mask,
      sufixIcon: sufixIcon,
      backgroundColor: backgroundColor,
      hasFocus: hasFocus,
      maxLength: maxLength,
      focusNode: focusNode,
      maxLines: maxLines,
      textAlign: textAlign,
      textCapitalization: textCapitalization,
      alignLabelWithHint: alignLabelWithHint,
      prefixText: prefixText,
      hintFocus: hintFocus,
      labelAbove: labelAbove,
      fontSize: fontSize,
      fontWeight: fontWeight,
      showMandatorySign: showMandatorySign,
      readOnly: readOnly,
      onTap: onTap,
    );
  }

  /// Constructor for input email
  factory AppInput.email({
    Key? key,
    String error = '',
    required String label,
    required void Function(String) onChanged,
    String labelAbove = '',
    String? hint,
    String? initialValue,
    bool enabled = true,
    String helpText = '',
    List<TextInputFormatter>? inputFormmatters,
    Color? backgroundColor,
    FocusNode? focusNode,
  }) {
    return AppInput._(
      key: key,
      error: error,
      label: label,
      labelAbove: labelAbove,
      hint: hint ?? label,
      onChanged: onChanged,
      initialValue: initialValue,
      enabled: enabled,
      inputType: TextInputType.emailAddress,
      helpText: helpText,
      isPassword: false,
      backgroundColor: backgroundColor,
      inputFormmatters: inputFormmatters ??
          [
            FilteringTextInputFormatter.deny(RegExp(r'\s\b|\b\s')),
            AppInputFormatterLowerCaseTxt(),
            AppInputFormatterTrimTxt(),
          ],
      maxLines: 1,
      focusNode: focusNode,
    );
  }

  /// Constructor for all with masked
  factory AppInput.masked({
    Key? key,
    String error = '',
    required String label,
    required void Function(String) onChanged,
    required AppMasked mask,
    String labelAbove = '',
    String? hint,
    String? initialValue,
    bool enabled = true,
    String helpText = '',
    Widget? sufixIcon,
    List<TextInputFormatter>? inputFormmatters,
    TextInputType? inputType,
    Color? backgroundColor,
    FocusNode? focusNode,
  }) {
    return AppInput._(
      key: key,
      error: error,
      label: label,
      labelAbove: labelAbove,
      hint: hint ?? label,
      onChanged: onChanged,
      initialValue: initialValue,
      mask: mask,
      enabled: enabled,
      inputType: inputType ?? TextInputType.text,
      helpText: helpText,
      isPassword: false,
      inputFormmatters: inputFormmatters,
      backgroundColor: backgroundColor,
      focusNode: focusNode,
      sufixIcon: sufixIcon,
    );
  }

  /// Constructor for input password
  factory AppInput.password({
    Key? key,
    String error = '',
    required String label,
    required void Function(String) onChanged,
    String labelAbove = '',
    String? hint,
    String? initialValue,
    bool enabled = true,
    String helpText = '',
    Color? backgroundColor,
    FocusNode? focusNode,
  }) {
    return AppInput._(
      key: key,
      error: error,
      label: label,
      labelAbove: labelAbove,
      hint: hint ?? label,
      onChanged: onChanged,
      initialValue: initialValue,
      enabled: enabled,
      inputType: TextInputType.text,
      helpText: helpText,
      isPassword: true,
      backgroundColor: backgroundColor,
      maxLines: 1,
      focusNode: focusNode,
    );
  }

  /// Constructor for input area
  factory AppInput.area({
    Key? key,
    String error = '',
     String label = '',
    required void Function(String) onChanged,
    int? maxLength,
    String? hint,
    String labelAbove = '',
    String? initialValue,
    bool enabled = true,
    String helpText = '',
    Color? backgroundColor,
    FocusNode? focusNode,
    int? maxLines,
    bool? alignLabelWithHint,
    bool showMandatorySign = false,
  }) {
    return AppInput._(
      key: key,
      error: error,
      label: label,
      labelAbove: labelAbove,
      hint: hint ?? label,
      onChanged: onChanged,
      initialValue: initialValue,
      helpText: helpText,
      enabled: enabled,
      isPassword: false,
      maxLines: maxLines,
      inputType: TextInputType.multiline,
      maxLength: maxLength,
      backgroundColor: backgroundColor,
      focusNode: focusNode,
      alignLabelWithHint: alignLabelWithHint,
      showMandatorySign: showMandatorySign,
    );
  }

  /// [AppInput] private constructor
  const AppInput._({
    super.key,
    required this.error,
    required this.label,
    required this.hint,
    required this.onChanged,
    required this.helpText,
    required this.enabled,
    required this.isPassword,
    required this.inputType,
    required this.labelAbove,
    this.sufixIcon,
    this.initialValue,
    this.inputFormmatters,
    this.mask,
    this.backgroundColor,
    this.maxLength,
    this.maxLines,
    this.hasFocus,
    this.focusNode,
    this.alignLabelWithHint = false,
    this.textAlign,
    this.textCapitalization = TextCapitalization.none,
    this.prefixText,
    this.hintFocus,
    this.fontSize,
    this.fontWeight,
    this.showMandatorySign = false,
    this.readOnly = false,
    this.onTap,
  });

  /// Masked for input
  /// Example of use
  /// ```dart
  /// AppMasked(mask: '000.000.000-00'), //for CPF
  /// AppMasked(mask: '00000-000'), //for CEP
  /// ```
  /// 'A' represents a letter of the alphabet
  /// '0' represents a numeric character
  /// '@' represents a alphanumeric character
  /// '*' represents any character
  final AppMasked? mask;

  /// This widget is circunded for gesture detector
  /// and callback is onTapPrefix
  final Widget? sufixIcon;

  /// Used for error display
  final String error;

  /// Help text
  final String helpText;

  /// Label
  final String? label;

  /// Hint text
  final String? hint;

  /// Field enabled. Default is true
  final bool enabled;

  /// Initial input value
  final String? initialValue;

  /// Enable or disable obscure
  final bool isPassword;

  /// Input type
  final TextInputType inputType;

  /// Function for change
  final void Function(String) onChanged;

  ///m Check if has focus
  final void Function(bool)? hasFocus;

  /// Input formatters
  final List<TextInputFormatter>? inputFormmatters;

  /// Background color
  final Color? backgroundColor;

  /// Used in input area
  final int? maxLength;

  /// Used in input area
  final int? maxLines;

  /// Custom focus node
  final FocusNode? focusNode;

  /// Align Label iwth Hint
  final bool? alignLabelWithHint;

  /// Align to input text
  final TextAlign? textAlign;

  /// TextCapitalization
  final TextCapitalization textCapitalization;

  // Prefix text
  final String? prefixText;

  final String? hintFocus;
  final String labelAbove;

  final double? fontSize;
  final FontWeight? fontWeight;

  final bool showMandatorySign;

  final bool readOnly;

  final VoidCallback? onTap;

  @override
  State<StatefulWidget> createState() => AppInputState();
}

///
class AppInputState extends State<AppInput> {
  late FocusNode _textFocus;
  final _masked = AppMasked();
  bool _obscure = false;
  bool _hasFocus = false;

  String error = '';

  @override
  void initState() {
    _textFocus = widget.focusNode ?? FocusNode();
    if (widget.mask != null) {
      updateMask(widget.mask!.mask ?? '');
    }
    _masked.text = widget.initialValue ?? '';
    _obscure = widget.isPassword;
    _textFocus.addListener(() {
      setState(() {
        _hasFocus = _textFocus.hasFocus;
      });
      if (widget.hasFocus != null) {
        widget.hasFocus!.call(_hasFocus);
      }
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AppInput oldWidget) {
    if (oldWidget.mask?.mask != widget.mask?.mask) {
      updateMask(widget.mask?.mask ?? '');
      String prevUnmasktext = _masked.text;
      if (oldWidget.mask != null &&
          oldWidget.mask?.mask != null &&
          oldWidget.mask!.mask!.isNotEmpty &&
          _masked.text.isNotEmpty) {
        prevUnmasktext = oldWidget.mask!.unmask(
          oldWidget.mask!.mask!,
          _masked.text,
        );
        _masked.value = TextEditingValue(text: prevUnmasktext);
      } else {
        _masked.updateText(_masked.text);
      }
    }
    if (oldWidget.initialValue != widget.initialValue) {
      setState(() {
        _masked.text = widget.initialValue ?? '';
      });
    }

    if (oldWidget.error != widget.error) {
      setState(() {
        error = widget.error;
      });
    }

    super.didUpdateWidget(oldWidget);
  }

  /// For update mask
  void updateMask(String mask) {
    if (mask.isNotEmpty) {
      _masked.mask = mask;
    } else {
      _masked.mask = null;
    }
  }

  @override
  void dispose() {
    _textFocus.dispose();
    super.dispose();
  }

  Color get _messageColor =>
      widget.enabled ? AppColor.neutral.dark : AppColor.secondary.light;

  Text _informationText(Color textColor, String text) {
    return Text(
      text,
      style: AppTypografy.captionRegular.copyWith(
        color: textColor,
      ),
      textAlign: TextAlign.right,
      maxLines: 2,
    );
  }

  Color _iconColor() {
    if (!widget.enabled) {
      return AppColor.neutral.light;
    } else if (_hasFocus) {
      return AppColor.primary.dark;
    }
    return AppColor.neutral.muted;
  }

  void _setObscure() {
    setState(() {
      _obscure = !_obscure;
    });
  }

  Widget? _sufixIcon(Color iconColor) {
    if (widget.isPassword) {
      return GestureDetector(
        onTap: _setObscure,
        child: SizedBox(
          width: 24,
          height: 24,
          child: Icon(
            _obscure ? Icons.visibility : Icons.visibility_off,
            color: iconColor,
          ),
        ),
      );
    }
    return SizedBox(width: 24, height: 24, child: widget.sufixIcon);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (widget.labelAbove.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              children: [
                Text(
                  widget.labelAbove,
                  style: AppTypografy.h4Semi,
                ),
                if (widget.showMandatorySign)
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      widget.labelAbove,
                      style: AppTypografy.h4Semi,
                    ),
                  ),
              ],
            ),
          ),
        TextFormField(
          textCapitalization: widget.textCapitalization,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          controller: _masked,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          obscureText: _obscure,
          focusNode: _textFocus,
          inputFormatters: widget.inputFormmatters,
          keyboardType: widget.inputType,
          textAlign: widget.textAlign ?? TextAlign.start,
          onChanged: (value) => widget.onChanged.call(value),
          onTap: widget.readOnly ? widget.onTap : null,
          onTapOutside: (event) => _textFocus.unfocus(),
          style: AppTypografy.bodyRegular.copyWith(
            fontSize: widget.fontSize ?? 14,
            fontWeight: widget.fontWeight ?? FontWeight.normal,
            // color:
            //     widget.enabled ? AppColor.neutral.dark : AppColor.neutral.muted,
          ),
          decoration: InputDecoration(
            alignLabelWithHint: widget.alignLabelWithHint,
            isDense: true,
            filled: true,
            labelText: _labelText(),
            hintText: _hasFocus || _masked.text.isNotEmpty
                ? widget.hintFocus ?? widget.hint
                : widget.hint,
            // fillColor: widget.backgroundColor,
            floatingLabelStyle: AppTypografy.bodyRegular.copyWith(
              color: AppColor.neutral.muted,
            ),
            errorStyle: AppTypografy.captionRegular.copyWith(
              color: AppColor.semantic.danger,
              height: 0,
            ),
            labelStyle: AppTypografy.bodyRegular.copyWith(
              color: widget.enabled
                  ? AppColor.neutral.muted
                  : AppColor.secondary.light,
            ),
            errorText: error.isNotEmpty ? '' : null,
            prefixText: widget.prefixText,
            suffixIcon: _sufixIcon(
              error.isNotEmpty ? AppColor.semantic.danger : _iconColor(),
            ),
            counterStyle: AppTypografy.captionRegular.copyWith(
              color: _messageColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        Visibility(
          visible: widget.helpText.isNotEmpty || error.isNotEmpty,
          child: Container(
            padding: const EdgeInsets.only(
              //  top: 4,
              right: 4,
              left: 4,
            ),
            child: Visibility(
              visible: error.isNotEmpty,
              replacement: _informationText(_messageColor, widget.helpText),
              child: _informationText(
                AppColor.semantic.danger,
                error,
              ),
            ),
          ),
        ),
      ],
    );
  }

  String? _labelText() {
    if (widget.label == null) {
      return widget.label;
    } else {
      if (_hasFocus || _masked.text.isNotEmpty) {
        return widget.label;
      } else {
        return widget.hint != "" ? widget.hint : widget.label;
      }
    }
  }
}
