extension IsomorphicString on String {
  bool isIsomorphicTo(String other) {
    if (length != other.length) return false;

    final Map<String, String> charMap = {};
    final Set<String> mappedChars = {};

    for (var i = 0; i < length; i++) {
      final s = this[i];
      final t = other[i];

      final mapped = charMap[s];
      if (mapped != null) {
        if (mapped != t) return false;
      } else {
        if (!mappedChars.add(t)) return false;
        charMap[s] = t;
      }
    }
    return true;
  }
}
