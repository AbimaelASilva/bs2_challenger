import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../../data/data.dart';

class ThemeController {
  ThemeController._() {
    loadSavedTheme();
  }

  static final ThemeController instance = ThemeController._();

  final themeModeNotifier = ValueNotifier<ThemeMode>(ThemeMode.light);

  final StorageService _storageService = GetIt.I.get();

  void toggleTheme() {
    themeModeNotifier.value = themeModeNotifier.value == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;

    _storageService.saveString(
      'app_theme',
      themeModeNotifier.value == ThemeMode.dark ? 'dark' : 'light',
    );
  }

  void loadSavedTheme() {
    final savedTheme = _storageService.fetchString('app_theme');
    savedTheme.fold(
      (success) => themeModeNotifier.value =
          success == 'dark' ? ThemeMode.dark : ThemeMode.light,
      (failure) => null,
    );
  }
}
