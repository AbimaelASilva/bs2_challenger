# ThemeAwareLogo

O `ThemeAwareLogo` é um widget que automaticamente alterna entre as logos `logoWhite` e `logoBlack` baseado no tema atual da aplicação.

## Como funciona

- **Tema Escuro**: Exibe `logoWhite` (logo branca)
- **Tema Claro**: Exibe `logoBlack` (logo preta)

## Uso

### Importação

```dart
import 'package:your_app/ui/core/components/atoms/image/theme_aware_logo.dart';
```

### Uso básico

```dart
const ThemeAwareLogo(height: 32)
```

### Com todas as propriedades

```dart
const ThemeAwareLogo(
  height: 50,
  width: 200,
  fit: BoxFit.contain,
)
```

## Propriedades

| Propriedade | Tipo | Obrigatório | Descrição |
|-------------|------|-------------|-----------|
| `height` | `double?` | Não | Altura da logo |
| `width` | `double?` | Não | Largura da logo |
| `fit` | `BoxFit?` | Não | Como a imagem deve se ajustar ao container |

## Exemplo de implementação

```dart
import 'package:flutter/material.dart';
import 'package:your_app/ui/core/components/atoms/image/theme_aware_logo.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const ThemeAwareLogo(height: 32),
      // ... outras propriedades
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
```

## Arquivos necessários

Certifique-se de que os seguintes arquivos existem em `assets/images/png/`:
- `logo_white.png` - Logo para tema escuro
- `logo_black.png` - Logo para tema claro

## Migração de código existente

Para migrar código que usa `logoWhite` fixo:

**Antes:**
```dart
AppAssets.images.png.logoWhite.image(height: 32)
```

**Depois:**
```dart
const ThemeAwareLogo(height: 32)
```

## Vantagens

1. **Automático**: Não precisa de lógica manual para alternar logos
2. **Consistente**: Garante que a logo sempre seja visível independente do tema
3. **Manutenível**: Mudanças no tema são refletidas automaticamente
4. **Reutilizável**: Pode ser usado em qualquer lugar da aplicação 