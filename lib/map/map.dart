class MapExercise {
  Map<int, int> countOccurrences(List<int> numbers) {
    Map<int, int> result = {};
    for (int i = 0; i < numbers.length; i++) {
      result.update(numbers[i], (value) => value + 1, ifAbsent: () => 1);
    }
    return result;
  }

  Map<String, int> filterMapByValue(Map<String, int> map, int threshold) {
    map = Map.fromEntries(
      map.entries.where((entry) => entry.value >= threshold),
    );
    return map;
  }

  Map<String, int> mergeMaps(Map<String, int> map1, Map<String, int> map2) {
    Map<String, int> result = {};
    map1.forEach((key, value) {
      result[key] = value;
    });
    map2.forEach((key, value) {
      result.update(
        key,
        (existingValue) => existingValue + value,
        ifAbsent: () => value,
      );
    });
    return result;
  }

  // the task not mention the case when there are  values are same  like  apple 1   ,  bananna 1 ... i did overwrite:)
  Map<int, String> invertMap(Map<String, int> map) {
    Map<int, String> result = {};
    map.forEach((key, value) {
      result[value] = key;
    });
    return result;
  }

  String findKeyWithMaximumValue(Map<String, int> map) {
    if (map.isEmpty) {
      throw Exception("Empty");
    }
    String maxKey = map.keys.first;
    int maxValue = map[maxKey]!;

    map.forEach((key, value) {
      if (value > maxValue) {
        maxKey = key;
        maxValue = value;
      }
    });
    return maxKey;
  }

  List<String> sortMapKeys(Map<String, int> map) {
    List<String> keys = map.keys.toList();
    keys.sort((a, b) => map[a]!.compareTo(map[b]!));
    return keys;
  }

  Map<String, List<String>> groupStringsByTheirFirstCharacter(
    List<String> list,
  ) {
    Map<String, List<String>> result = {};

    for (int i = 0; i < list.length; i++) {
      if (result.containsKey(list[i][0])) {
        result[list[i][0]]!.add(list[i]);
      } else {
        result[list[i][0]] = [list[i]];
      }
    }
    return result;
  }
}
