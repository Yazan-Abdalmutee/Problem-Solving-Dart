class SubstringSearch {
  final String text;
  final String pattern;

  SubstringSearch({required this.text, required this.pattern});

  int _textLength() => text.length;
  int _patternLength() => pattern.length;
  int _outerLoopRange() => _textLength() - _patternLength() + 1;

  bool containsSubstringManual() {
    int counter = 0;
    for (int i = 0; i < _outerLoopRange(); i++) {
      counter = 0;
      for (int j = i; j < _patternLength() + i; j++) {
        if (pattern[counter] != text[j]) {
          break;
        }
        counter++;
      }
      if (counter == _patternLength()) {
        return true;
      }
    }
    return false;
  }

  int firstOccurrenceManual() {
    int counter = 0;
    for (int i = 0; i < _outerLoopRange(); i++) {
      counter = 0;
      for (int j = i; j < _patternLength() + i; j++) {
        if (pattern[counter] != text[j]) {
          break;
        }
        counter++;
      }
      if (counter == _patternLength()) {
        return i;
      }
    }
    return -1;
  }

  List<int> allOccurrencesManual() {
    int counter = 0;
    List<int> result = [];
    for (int i = 0; i < _outerLoopRange(); i++) {
      counter = 0;
      for (int j = i; j < _patternLength() + i; j++) {
        if (pattern[counter] != text[j]) {
          break;
        }
        counter++;
      }
      if (counter == _patternLength()) {
        result.add(i);
      }
    }
    return result;
  }

  bool containsSubstringBuiltIn() {
    return text.contains(pattern);
  }

  int firstOccurrenceBuiltIn() {
    return text.indexOf(pattern);
  }

  List<int> allOccurrencesBuiltIn() {
    List<int> result = [];
    int startIndex = 0;

    while (true) {
      int foundIndex = text.indexOf(pattern, startIndex);
      if (foundIndex == -1) {
        break;
      }
      result.add(foundIndex);
      startIndex = foundIndex + 1;
    }
    return result;
  }
}
