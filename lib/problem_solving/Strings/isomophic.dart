class Isomophic {
  bool isIsomophic(String a, String b) {
    Map<String, String> map = {};
    Set<String> values = {};
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (map.containsKey(a[i])) {
        if (b[i] != map[a[i]]) {
          return false;
        }
      } else {
        if (values.contains(b[i])) return false;
        map[a[i]] = b[i];
        values.add(b[i]);
      }
    }
    return true;
  }
}
