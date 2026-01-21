import 'dart:math';

String get generateUniqueId {
  final timestamp = DateTime.now().millisecondsSinceEpoch;
  final base36Time = timestamp.toRadixString(36); // Ex: '6718v5d7a9'

  // Usamos no máximo os primeiros 9 caracteres do timestamp convertido
  final timePart = base36Time.substring(0, min(9, base36Time.length));

  // Restantes caracteres até 15 (ex: 15 - 9 = 6 aleatórios)
  final remaining = 15 - timePart.length;

  final random = Random.secure();
  final randomPart =
      List.generate(remaining, (_) => _randomChar(random)).join();

  return '$timePart$randomPart';
}

String _randomChar(Random random) {
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  return chars[random.nextInt(chars.length)];
}
