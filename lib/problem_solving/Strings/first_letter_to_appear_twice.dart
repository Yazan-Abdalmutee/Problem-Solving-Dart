extension FirstLetterToAppearTwice on String {
  String getFirstLetterApearsTwice() {
    if (isEmpty) return "";

    final Set<String> mappedChars = {};
    for (int i = 0; i < length; i++) {
      if (mappedChars.contains(this[i])) {
        return this[i];
      } else {
        mappedChars.add(this[i]);
      }
    }
    return "";
  }
}
