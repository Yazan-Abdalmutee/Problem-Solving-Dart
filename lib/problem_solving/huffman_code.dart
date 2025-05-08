class Node {
  Node(this.char, this.frequency, {this.left, this.right});

  int frequency;
  String char;
  Node? left;
  Node? right;
}

class MinHeap {
  final List<Node> _heap = [];

  int _getLeftChildIndex(int index) => 2 * index + 1;
  int _getRightChildIndex(int index) => 2 * index + 2;
  int _getParentIndex(int index) => (index - 1) ~/ 2;

  bool _hasLeftChild(int index) => _getLeftChildIndex(index) < size;
  bool _hasRightChild(int index) => _getRightChildIndex(index) < size;
  bool _hasParent(int index) => _getParentIndex(index) >= 0;

  int _leftChild(int index) => _heap[_getLeftChildIndex(index)].frequency;
  int _rightChild(int index) => _heap[_getRightChildIndex(index)].frequency;
  int _parent(int index) => _heap[_getParentIndex(index)].frequency;

  void _swap(int index1, index2) {
    Node temp = _heap[index1];
    _heap[index1] = _heap[index2];
    _heap[index2] = temp;
  }

  Node extractMinNode() {
    if (isEmpty) {
      throw Exception("Heap is empty");
    }
    Node item = _heap[0];
    _heap[0] = _heap[size - 1];
    _heap.removeLast();
    _heapifyDown();
    return item;
  }

  void add(Node item) {
    _heap.add(item);
    _heapifyUp();
  }

  void _heapifyUp() {
    int index = size - 1;
    while (_hasParent(index) && _parent(index) > _heap[index].frequency) {
      _swap(_getParentIndex(index), index);
      index = _getParentIndex(index);
    }
  }

  void _heapifyDown() {
    int index = 0;

    while (_hasLeftChild(index)) {
      int smallerChildIndex = _getLeftChildIndex(index);
      if (_hasRightChild(index) && _rightChild(index) < _leftChild(index)) {
        smallerChildIndex = _getRightChildIndex(index);
      }
      if (_heap[index].frequency < _heap[smallerChildIndex].frequency) {
        break;
      } else {
        _swap(index, smallerChildIndex);
      }
      index = smallerChildIndex;
    }
  }

  bool get isEmpty => _heap.isEmpty;
  int get size => _heap.length;
}

class HuffmanCoding {
  Map<String, String> huffmanCodes = {};
  MinHeap minHeap = MinHeap();

  void buildHuffmanTree(Map<String, int> items) {
    List<Node> nodes = [];
    items.forEach((character, frequency) {
      nodes.add(Node(character, frequency));
    });
    for (int i = 0; i < nodes.length; i++) {
      minHeap.add(nodes[i]);
    }
    while (minHeap.size > 1) {
      Node left = minHeap.extractMinNode();
      Node right = minHeap.extractMinNode();
      Node newNode = Node(
        left.char + right.char,
        left.frequency + right.frequency,
      );
      newNode.left = left;
      newNode.right = right;
      minHeap.add(newNode);
    }
    if (!minHeap.isEmpty) generateHuffmanCodes(minHeap._heap.first, '');
  }

  void generateHuffmanCodes(Node? node, String code) {
    if (node == null) {
      return;
    }
    if (node.left == null && node.right == null) {
      huffmanCodes[node.char] = code;
    }
    generateHuffmanCodes(node.left, "${code}0");
    generateHuffmanCodes(node.right, "${code}1");
  }

  String decodeHuffmanCodesUsingMap(String code) {
    Map<String, String> swappedMap = {};
    int codeMaxLength = 0;
    huffmanCodes.forEach((character, code) {
      swappedMap[code] = character;
      if (code.length > codeMaxLength) {
        codeMaxLength = code.length;
      }
    });
    String decodedMsg = "";
    bool isDecoded = false;
    for (int i = 0; i < code.length; i++) {
      String temp = "";
      String decodedLetter = "";
      isDecoded = false;
      int outerLoopIndex = i;
      for (
        int j = outerLoopIndex;
        j < codeMaxLength + outerLoopIndex && j < code.length;
        j++
      ) {
        temp += code[j];
        if (swappedMap.containsKey(temp)) {
          decodedLetter = swappedMap[temp]!;
          i = j;
          isDecoded = true;
        }
      }
      decodedMsg += decodedLetter;
      if (!isDecoded) {
        throw Exception("Wrong code");
      }
    }
    return decodedMsg;
  }

  String decodeHuffmanCodesUsingHuffmanTree(String code) {
    String decodedMsg = "";
    Node curr = minHeap._heap.first;
    int length = code.length;
    for (int i = 0; i < length; i++) {
      if (code[i] == "0") {
        curr = curr.left!;
      } else {
        curr = curr.right!;
      }
      if (curr.left == null && curr.right == null) {
        decodedMsg += curr.char;
        curr = minHeap._heap.first;
      }
    }
    return decodedMsg;
  }
}
