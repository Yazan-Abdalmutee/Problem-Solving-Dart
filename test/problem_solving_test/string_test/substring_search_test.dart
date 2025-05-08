import 'package:problem_solving_dart/problem_solving/Strings/substring_search.dart';
import 'package:test/test.dart';

void main() {
  group('SubstringSearch Tests', () {
    test('containsSubstringManual returns true when substring is found', () {
      SubstringSearch substringSearch = SubstringSearch(
        text: 'banana',
        pattern: 'ana',
      );
      expect(substringSearch.containsSubstringManual(), equals(true));
    });

    test(
      'containsSubstringManual returns false when substring is not found',
      () {
        SubstringSearch substringSearch = SubstringSearch(
          text: 'yazan',
          pattern: 'ok',
        );
        expect(substringSearch.containsSubstringManual(), equals(false));
      },
    );

    test('firstOccurrenceManual returns index of first occurrence', () {
      SubstringSearch substringSearch = SubstringSearch(
        text: 'banana',
        pattern: 'ana',
      );
      expect(substringSearch.firstOccurrenceManual(), equals(1));
    });

    test('firstOccurrenceManual returns -1 when substring is not found', () {
      SubstringSearch substringSearch = SubstringSearch(
        text: 'banana',
        pattern: 'no',
      );
      expect(substringSearch.firstOccurrenceManual(), equals(-1));
    });

    test('allOccurrencesManual returns all occurrence index', () {
      SubstringSearch substringSearch = SubstringSearch(
        text: 'banana',
        pattern: 'ana',
      );
      expect(substringSearch.allOccurrencesManual(), equals([1, 3]));
    });

    test(
      'allOccurrencesManual returns empty list when substring is not found',
      () {
        SubstringSearch substringSearch = SubstringSearch(text: 'banana', pattern: 'ok');
        expect(substringSearch.allOccurrencesManual(), equals([]));
      },
    );

    test('containsSubstringBuiltIn returns true when substring is found', () {
      SubstringSearch substringSearch = SubstringSearch(text: 'banana', pattern: 'ana');
      expect(substringSearch.containsSubstringBuiltIn(), equals(true));
    });

    test(
      'containsSubstringBuiltIn returns false when substring is not found',
      () {
        SubstringSearch substringSearch = SubstringSearch(
          text: 'banana',
          pattern: 'ok',
        );
        expect(substringSearch.containsSubstringBuiltIn(), equals(false));
      },
    );

    test('firstOccurrenceBuiltIn returns index of first occurrence', () {
      SubstringSearch substringSearch = SubstringSearch(
        text: 'banana',
        pattern: 'ana',
      );
      expect(substringSearch.firstOccurrenceBuiltIn(), equals(1));
    });

    test('firstOccurrenceBuiltIn returns -1 when substring is not found', () {
      SubstringSearch substringSearch = SubstringSearch(
        text: 'banana',
        pattern: 'ok',
      );
      expect(substringSearch.firstOccurrenceBuiltIn(), equals(-1));
    });

    test('allOccurrencesBuiltIn returns all occurrence indexes', () {
      SubstringSearch substringSearch = SubstringSearch(
        text: 'banana',
        pattern: 'ana',
      );
      expect(substringSearch.allOccurrencesBuiltIn(), equals([1, 3]));
    });

    test(
      'allOccurrencesBuiltIn returns empty list when substring is not found',
      () {
        SubstringSearch substringSearch = SubstringSearch(
          text: 'banana',
          pattern: 'ok',
        );
        expect(substringSearch.allOccurrencesBuiltIn(), equals([]));
      },
    );
  });
}
