import 'package:problem_solving_dart/problem_solving/Strings/first_letter_to_appear_twice.dart';
import 'package:test/test.dart';

void main() {
  group('first_letter_to_appear_twice tests', () {
    test('Should return first chat appears twice', () {
      expect("abcdd".getFirstLetterApearsTwice(), equals("d"));
    });

    test('Should return nothing for empty', () {
      expect("".getFirstLetterApearsTwice(), equals(""));
    });

    test('Should return nothing for the case has no dublicate chars', () {
      expect("abcd".getFirstLetterApearsTwice(), equals(""));
    });
  });
}
