class Anagrams {
  final String firstString;
  final String secoundString;

  Anagrams({required this.firstString, required this.secoundString});

  int _firstStringLength() => firstString.length;
  int _secoundStringLength() => secoundString.length;

  bool isAnagramsBuiltIn() {
    if (_firstStringLength() != _secoundStringLength()) {
      return false;
    }
    List<String> s1 = firstString.split('');
    s1.sort();
    String sortedFirstString = s1.join('');

    List<String> s2 = secoundString.split('');
    s2.sort();
    String sortedSecoundString = s2.join('');
    return sortedFirstString == sortedSecoundString;
  }

  bool isAnagramsManual() {
    if (_firstStringLength() != _secoundStringLength()) {
      return false;
    }
    Map<String, int> map = {};
    for (int i = 0; i < _firstStringLength(); i++) {
      map.update(firstString[i], (value) => value + 1, ifAbsent: () => 1);
    }
    for (int i = 0; i < _secoundStringLength(); i++) {
      if (map.containsKey(secoundString[i]) && map[secoundString[i]]! > 0) {
        map[secoundString[i]] = map[secoundString[i]]! - 1;
      } else {
        return false;
      }
    }
    return true;
  }
}
