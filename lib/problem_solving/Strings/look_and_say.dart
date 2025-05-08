
class LookAndSay {
  String lookAndSayUsingRecursion(
    int number,
    String prev,
    String currentValues,
  ) {
    if (number == 1) {
      return currentValues;
    }
    int counter = 1;
    int? current = int.parse(currentValues[0]);
    prev = "";
    for (int j = 1; j < currentValues.length; j++) {
      if (int.parse(currentValues[j]) == current) {
        counter++;
      } else {
        prev += counter.toString();
        prev += current.toString();
        counter = 1;
        current = int.parse(currentValues[j]);
      }
    }
    prev += counter.toString();
    prev += current.toString();

    currentValues = "";

    for (int j = 0; j < prev.length; j++) {
      currentValues += ((prev[(j)]));
    }
    return lookAndSayUsingRecursion(number - 1, prev, currentValues);
  }

  String lookAndSayUsingStack(int number) {
    String prev = "";
    Stack<int> stack = Stack<int>();
    stack.push(1);
    for (int i = 2; i <= number; i++) {
      int counter = 1;
      int? current = stack.pop();
      prev = "";
      while (!stack.isEmpty()) {
        if (!stack.isEmpty() && stack.peek() == current) {
          counter++;
          stack.pop();
        } else {
          prev += counter.toString();
          prev += current.toString();
          counter = 1;
          if (!stack.isEmpty()) current = stack.pop()!;
        }
      }
      if (stack.isEmpty()) {
        prev += counter.toString();
        prev += current.toString();
      }

      for (int j = 0; j < prev.length; j++) {
        stack.push(int.parse(prev[(prev.length - j - 1)]));
      }
    }
    String result = "";
    while (!stack.isEmpty()) {
      result += stack.pop().toString();
    }
    return result;
  }

  String lookAndSayUsingIteration(int number) {
    String prev = "";
    String currentValues = "1";
    for (int i = 2; i <= number; i++) {
      int counter = 1;
      int? current = int.parse(currentValues[0]);
      prev = "";
      for (int j = 1; j < currentValues.length; j++) {
        if (int.parse(currentValues[j]) == current) {
          counter++;
        } else {
          prev += counter.toString();
          prev += current.toString();
          counter = 1;
          current = int.parse(currentValues[j]);
        }
      }
      prev += counter.toString();
      prev += current.toString();

      currentValues = "";

      for (int j = 0; j < prev.length; j++) {
        currentValues += ((prev[(j)]));
      }
    }
    return currentValues;
  }
}
