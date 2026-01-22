import 'package:flutter/material.dart';

import '../../../core/helper/localization_helper.dart';
import '../../../core/services/locale_service.dart';
import '../theme/app_colors.dart';
import 'images/images.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocale = Localizations.localeOf(context);
    final l10n = context.l10n;

    return IconButton(
      icon: AppImagesAssets(
        path: _getFlagPath(currentLocale),
        width: 24,
        height: 24,
      ),
      onPressed: () {
        showDialog<void>(
          context: context,
          builder: (dialogContext) => AlertDialog(
            title: Text(l10n.selectLanguage),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildLanguageOption(
                  dialogContext,
                  context,
                  const Locale('pt', 'BR'),
                  l10n.portuguese,
                  currentLocale,
                ),
                const SizedBox(height: 8),
                _buildLanguageOption(
                  dialogContext,
                  context,
                  const Locale('en'),
                  l10n.english,
                  currentLocale,
                ),
                const SizedBox(height: 8),
                _buildLanguageOption(
                  dialogContext,
                  context,
                  const Locale('es'),
                  l10n.spanish,
                  currentLocale,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _getFlagPath(Locale locale) {
    switch (locale.languageCode) {
      case 'pt':
        return AppImagesPath.brazil;
      case 'en':
        return AppImagesPath.usa;
      case 'es':
        return AppImagesPath.spain;
      default:
        return AppImagesPath.brazil;
    }
  }

  Widget _buildLanguageOption(
    BuildContext dialogContext,
    BuildContext parentContext,
    Locale locale,
    String label,
    Locale currentLocale,
  ) {
    final isSelected = locale.languageCode == currentLocale.languageCode;

    return ListTile(
      leading: AppImagesAssets(
        path: _getFlagPath(locale),
        width: 32,
        height: 32,
      ),
      title: Text(label),
      trailing: Radio<Locale>(
        value: locale,
        groupValue: currentLocale,
        onChanged: (value) async {
          if (value != null) {
            await LocaleService.setLocale(value);
            Navigator.of(dialogContext).pop();
          }
        },
      ),
      selected: isSelected,
      selectedTileColor: AppColors.getCardColor(parentContext),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      onTap: () async {
        await LocaleService.setLocale(locale);
        Navigator.of(dialogContext).pop();
      },
    );
  }
}
