import 'package:problem_solving_dart/problem_solving/ring_buffer.dart';
import 'package:test/test.dart';

void main() {
  group('RingBuffer Tests', () {
    late CircularBuffer<int> buffer;

    setUp(() {
      buffer = CircularBuffer<int>(capacity: 3);
    });

    test('Initial size is 0', () {
      expect(buffer.isEmpty(), equals(true));
      expect(buffer.isFull(), equals(false));
      expect(buffer.size, equals(0));
    });

    test('Add elements to the buffer:', () {
      buffer.add(1);
      buffer.add(2);
      buffer.add(3);
      expect(buffer.size, equals(3));
      expect(buffer.isEmpty(), equals(false));
      expect(buffer.isFull(), equals(true));
      expect(buffer.peek(), equals(1));
    });

    test(
      'Add elements more than capacity should over Write so peak will be different',
      () {
        buffer.add(1);
        buffer.add(2);
        buffer.add(3);
        buffer.add(3);

        expect(buffer.size, equals(3));
        expect(buffer.isEmpty(), equals(false));
        expect(buffer.isFull(), equals(true));
        expect(buffer.peek(), equals(2));
      },
    );

    test('Get should return oldest element in the buffer', () {
      buffer.add(1);
      buffer.add(2);
      buffer.add(3);
      buffer.add(4);
      buffer.add(5);

      expect(buffer.get(), equals(3));
      expect(buffer.peek(), equals(4));
      expect(buffer.size, equals(2));
      expect(buffer.isFull(), equals(false));
    });

    test('Clear buffer', () {
      buffer.add(5);
      buffer.add(6);
      buffer.clearBuffer();
      expect(buffer.isEmpty(), equals(true));
      expect(buffer.size, equals(0));
      expect(buffer.peek(), equals(null));
    });

    test('toList return elemnets from oldest to newest', () {
      buffer.add(1);
      buffer.add(2);
      buffer.add(3);
      buffer.add(4);
      buffer.add(5);
      expect(buffer.toList(), equals([3, 4, 5]));
    });
  });
}
