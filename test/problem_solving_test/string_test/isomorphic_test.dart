import 'package:problem_solving_dart/problem_solving/Strings/isomorphic.dart';
import 'package:test/test.dart';

void main() {
  group('Isomophic tests', () {
    test('Should return true for isomophic', () {
      Isomorphic isomophic = Isomorphic();
      expect(isomophic.isIsomorphic("aa", "bb"), equals(true));
    });

    test('Should return false for different length ', () {
      Isomorphic isomophic = Isomorphic();
      expect(isomophic.isIsomorphic("aaa", "bb"), equals(false));
    });

    test('Should return true for right Iso  ', () {
      Isomorphic isomophic = Isomorphic();
      expect(isomophic.isIsomorphic("abbac", "vccvk"), equals(true));
    });

    test('Should return false for wrong Iso  ', () {
      Isomorphic isomophic = Isomorphic();
      expect(isomophic.isIsomorphic("abbac", "vccnk"), equals(false));
    });
  });
}
