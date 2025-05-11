import 'package:problem_solving_dart/problem_solving/Strings/first_letter_to_appear_twice.dart';
import 'package:problem_solving_dart/problem_solving/huffman_code.dart';
import 'package:problem_solving_dart/problem_solving/Strings/anagrams.dart';
import 'package:problem_solving_dart/problem_solving/Strings/isomorphic.dart';
import 'package:problem_solving_dart/problem_solving/Strings/look_and_say.dart';
import 'package:problem_solving_dart/problem_solving/Strings/substring_search.dart';
import 'package:problem_solving_dart/problem_solving/ring_buffer.dart';

void main() {
  //runHuffmanExample();
  //runSubStringSearchExample();
  //runAnagramsExample();
  //countWordOccurrences("Hi How are You Hi You are ok");
  //runRingBufferExample();
  //lookAndSay(9);
  //lookAndSayIteration(9);
  //runLookAndSayExample();
  //runIsomophicExample();
  print("abnbah".getFirstLetterApearsTwice());
}

void runIsomophicExample() {
  print("alm".isIsomorphicTo("goj"));
}

void runLookAndSayExample() {
  LookAndSay lookAndSay = LookAndSay();
  print(lookAndSay.lookAndSayUsingRecursion(9, "", "1"));
  print(lookAndSay.lookAndSayUsingStack(9));
  print(lookAndSay.lookAndSayUsingIteration(9));
}

void countWordOccursrences(String s) {
  Map<String, int> result = {};

  List<String> words = s.split(' ');
  for (int i = 0; i < words.length; i++) {
    result.update(words[i], (value) => value + 1, ifAbsent: () => 1);
  }
  result.forEach((key, value) {
    print('$key:$value');
  });
}

void runRingBufferExample() {
  CircularBuffer<int> circularBuffer = CircularBuffer<int>(capacity: 3);
  circularBuffer.add(1);
  circularBuffer.add(2);
  circularBuffer.add(3);
  circularBuffer.add(4);
  circularBuffer.add(5);
  circularBuffer.add(6);
  circularBuffer.add(7);
  circularBuffer.add(8);
  circularBuffer.add(9);
  print('Peak is: ${circularBuffer.peek()}');
  print('Is Full?: ${circularBuffer.isFull()}');
  print('${circularBuffer.toList()}');
}

void runAnagramsExample() {
  Anagrams anagrams = Anagrams(
    firstString: 'racecar',
    secoundString: 'carrace',
  );
  print('is Anagrams (manual): ${anagrams.isAnagramsManual()}');
  print('is Anagrams (Built-in): ${anagrams.isAnagramsBuiltIn()}');
}

void runSubStringSearchExample() {
  SubstringSearch substringSearch = SubstringSearch(
    text: 'banana',
    pattern: 'ana',
  );
  print('Contains (manual): ${substringSearch.containsSubstringManual()}');
  print(
    'First occurrence (manual): ${substringSearch.firstOccurrenceManual()}',
  );
  print('All occurrences (manual): ${substringSearch.allOccurrencesManual()}');
  print('Contains (built-in):${substringSearch.containsSubstringBuiltIn()}');
  print(
    'First occurrence (built-in): ${substringSearch.firstOccurrenceBuiltIn()}',
  );
  print(
    'All occurrences (built-in): ${substringSearch.allOccurrencesBuiltIn()}',
  );
}

void runHuffmanExample() {
  Map<String, int> frequencies = {'A': 40, 'B': 35, 'C': 20, 'D': 5};

  HuffmanCoding huffmanCoding = HuffmanCoding();
  huffmanCoding.buildHuffmanTree(frequencies);

  print('Huffman Codes:');
  huffmanCoding.huffmanCodes.forEach((character, code) {
    print('$character: $code');
  });

  String code = "1011001100";
  try {
    print("Decoded Msg is: ${huffmanCoding.decodeHuffmanCodesUsingMap(code)}");
    print(
      "Decoded Msg is: ${huffmanCoding.decodeHuffmanCodesUsingHuffmanTree(code)}",
    );
  } catch (e) {
    print(e);
  }
}
