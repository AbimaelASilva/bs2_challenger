import 'dart:math';

extension CustomExtensionOnString on String {
  static const _withAccents = 'áàãâäéèêëíìîïóòõôöúùûüçÁÀÃÂÄÉÈÊËÍÌÎÏÓÒÕÔÖÚÙÛÜÇ';
  static const _withoutAccents =
      'aaaaaeeeeiiiiooooouuuucAAAAAEEEEIIIIOOOOOUUUUC';

  String get removeAccents {
    var str = this;
    for (int i = 0; i < _withAccents.length; i++) {
      str = str.replaceAll(_withAccents[i], _withoutAccents[i]);
    }
    return str;
  }

  String get removeSpecialChars => replaceAll(RegExp('[^a-zA-Z0-9]'), '');

  String get abbreviateFromSecondWord {
    // Divide o texto em palavras
    final words = split(' ');
    if (words.isEmpty) return this;

    // Mantém a primeira palavra completa e abrevia as outras
    final abbreviatedWords = [
      words.first, // Mantém a primeira palavra
      ...words.skip(1).map(
            (word) => word.isNotEmpty ? '${word[0]}.' : '',
          ), // Abrevia as palavras restantes
    ];

    // Junta as palavras com espaços
    return abbreviatedWords.join(' ');
  }

  String removeFirstWordIfCamp() {
    final words = split(' ');
    if (words.isNotEmpty && words.first.toLowerCase().startsWith('camp')) {
      words.removeAt(0);
    }
    return words.join(' ').trim();
  }

  String get firstWord {
    return split(' ').first;
  }

  String get capitalizeFirstLetters {
    return toLowerCase().split(' ').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1);
    }).join(' ');
  }

  String get cleanPhoneNumberWithCountryCode {
    return "55$removeSpecialChars";
  }

  String toUniqueLoginId() {
    final firstName = trim().split(' ').first.toUpperCase();
    final timestamp = DateTime.now().microsecondsSinceEpoch;
    final random = Random().nextInt(1000); // 0 a 999
    final combined = timestamp + random; // aumenta entropia
    final suffix = _toBase36(combined).substring(0, 6); // Mais entropia
    return "@$firstName-$suffix";
  }

  // Converte inteiro para base36 (0-9 + A-Z)
  String _toBase36(int value) {
    const chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    if (value == 0) return '0';
    var result = '';
    while (value > 0) {
      result = chars[value % 36] + result;
      value ~/= 36;
    }
    return result;
  }

  double toBrazilianDouble() {
    // Remove o "R$", espaços e pontos de milhar, depois troca vírgula por ponto
    final cleaned = replaceAll(r'R$', '') // remove símbolo R$
        .replaceAll('.', '') // remove pontos de milhar
        .replaceAll(',', '.') // troca vírgula decimal por ponto
        .trim(); // remove espaços

    return double.tryParse(cleaned) ?? 0.0;
  }

  bool get isValidPhoneNumber {
    // Remove todos os caracteres não numéricos
    final digitsOnly = replaceAll(RegExp(r'\D'), '');

    // Verifica se tem exatamente 11 dígitos (2 do DDD + 9 do número)
    if (digitsOnly.length != 11) return false;

    // Verifica se o DDD é válido e se começa com 9 e segundo dígito entre 6-9
    final regex = RegExp(r'^(1[1-9]|[2-9][0-9])9[6-9][0-9]{7}$');
    return regex.hasMatch(digitsOnly);
  }

  bool get isNumericOnly {
    final numericRegex = RegExp(r'^\d+$');
    return numericRegex.hasMatch(this);
  }

  String get toBrazilianPhone {
    String cleaned = this;

    // Remove tudo que não for número
    cleaned = cleaned.replaceAll(RegExp(r'\D'), '');

    // Remove o prefixo 55 se estiver no início
    if (cleaned.startsWith('55')) {
      cleaned = cleaned.substring(2);
    }

    // Garante que tenha ao menos 11 dígitos (código + número)
    if (cleaned.length == 11) {
      final ddd = cleaned.substring(0, 2);
      final parte1 = cleaned.substring(2, 7);
      final parte2 = cleaned.substring(7, 11);
      return '($ddd) $parte1-$parte2';
    }

    // Retorna original se não tiver formato válido
    return this;
  }

  bool get isValidCustomId {
    final regex = RegExp(r'^[a-z0-9]{20}$');
    return regex.hasMatch(this);
  }
}
