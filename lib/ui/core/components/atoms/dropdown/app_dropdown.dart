import 'package:flutter/material.dart';

import '../../../theme/theme_data_dark.dart';

class AppDropdown<T> extends StatelessWidget {
  const AppDropdown({
    super.key,
    required this.enabled,
    required this.labelAbove,
    required this.items,
    required this.onChanged,
    this.sufixIcon,
    this.helpText = '',
    this.errorText = '',
    this.value,
    this.prefix,
  });

  final bool enabled;
  final String labelAbove;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?) onChanged;
  final Widget? sufixIcon;
  final String helpText;
  final String errorText;
  final T? value;
  final Widget? prefix;

  Color get _messageColor => enabled ? AppColor.neutral.dark : AppColor.secondary.light;

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (labelAbove.isNotEmpty)
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  labelAbove,
                  style: AppTypografy.h4Semi,
                ),
              ),
            ],
          ),
        SizedBox(
          height: 48,
          child: DropdownButtonFormField<T>(
            isExpanded: true,
            borderRadius: AppBorderRadius.xm,
            value: value,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 16, right: 16),
              prefix: prefix,
            ),
            style: AppTypografy.bodyRegular.copyWith(
              color: enabled ? AppColor.neutral.muted : AppColor.neutral.light,
            ),
            hint: Text(
              labelAbove,
            ),
            items: items,
            onChanged: onChanged,
            onSaved: (newValue) {},
            iconSize: 18,
            icon: sufixIcon,
          ),
        ),
        Visibility(
          visible: helpText.isNotEmpty || errorText.isNotEmpty,
          child: Container(
            padding: const EdgeInsets.only(
              top: 4,
              right: 4,
              left: 4,
            ),
            child: Visibility(
              visible: errorText.isNotEmpty,
              replacement: _informationText(_messageColor, helpText),
              child: _informationText(
                AppColor.semantic.danger,
                errorText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
