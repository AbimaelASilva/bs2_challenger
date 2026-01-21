extension IntExtensions on int {
  bool isMultipleOf(int other) {
    if (other == 0) return false; // Evita divisão por zero
    return this % other == 0;
  }
}
