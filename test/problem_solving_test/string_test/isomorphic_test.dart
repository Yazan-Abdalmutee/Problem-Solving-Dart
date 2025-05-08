import 'package:problem_solving_dart/problem_solving/Strings/isomorphic.dart';
import 'package:test/test.dart';

void main() {
  group('Isomophic tests', () {
    test('Should return true for isomophic', () {
      expect("aa".isIsomorphicTo("bb"), equals(true));
    });

    test('Should return false for different length ', () {
      expect("aaa".isIsomorphicTo("bb"), equals(false));
    });

    test('Should return true for right Iso  ', () {
      expect("abbac".isIsomorphicTo("vccvk"), equals(true));
    });

    test('Should return false for wrong Iso  ', () {
      expect("abbac".isIsomorphicTo("vccnk"), equals(false));
    });
  });
}
