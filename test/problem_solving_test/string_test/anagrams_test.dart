import 'package:problem_solving_dart/problem_solving/Strings/anagrams.dart';
import 'package:test/test.dart';

void main() {
  group('Anagrams tests', () {
    test('Should return true for anagrams [Built-In]', () {
      Anagrams anagram = Anagrams(
        firstString: 'racecar',
        secoundString: 'carrace',
      );
      expect(anagram.isAnagramsBuiltIn(), equals(true));
    });

    test('Should return false for non-anagrams [Built-In]', () {
      Anagrams anagram = Anagrams(firstString: 'hello', secoundString: 'yazan');
      expect(anagram.isAnagramsBuiltIn(), equals(false));
    });

    test('Should return true for anagrams [Manual]', () {
      Anagrams anagram = Anagrams(
        firstString: 'racecar',
        secoundString: 'carrace',
      );
      expect(anagram.isAnagramsManual(), equals(true));
    });

    test('Should return false for non-anagrams [Manual]', () {
      Anagrams anagram = Anagrams(firstString: 'hello', secoundString: 'yazan');
      expect(anagram.isAnagramsManual(), equals(false));
    });
  });
}
