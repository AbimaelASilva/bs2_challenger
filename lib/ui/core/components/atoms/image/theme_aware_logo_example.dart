import 'package:flutter/material.dart';
import '../../../../core/core.dart';
import '../../../theme/theme_controller.dart';
import 'theme_aware_logo.dart';

/// Widget de exemplo que demonstra o uso do ThemeAwareLogo
///
/// Este widget mostra como a logo muda automaticamente baseada no tema
class ThemeAwareLogoExample extends StatelessWidget {
  const ThemeAwareLogoExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo ThemeAwareLogo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: ThemeController.instance.toggleTheme,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Logo que muda automaticamente com o tema:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const ThemeAwareLogo(height: 100),
            const SizedBox(height: 40),
            Text(
              'Tema atual: ${Theme.of(context).brightness == Brightness.dark ? 'Escuro' : 'Claro'}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: ThemeController.instance.toggleTheme,
              child: const Text('Alternar Tema'),
            ),
          ],
        ),
      ),
    );
  }
}
