class CircularBuffer<T> {
  CircularBuffer({required this.capacity}) {
    if (capacity <= 0) {
      throw ArgumentError("Capacity Should be >0");
    }
    buffer = List<T?>.filled(capacity, null);
  }
  late List<T?> buffer;
  int capacity;
  int _read = 0;
  int _write = 0;
  int _size = 0;

  int totalCapacity() {
    return capacity;
  }

  int get size => _size;

  void add(T value) {
    if (_size < capacity) _size++;
    buffer[_write] = value;
    if (_write == _read && buffer[_read] != null) {
      _read++;
      if (_read >= capacity) _read = 0;
    }
    _write++;

    if (_write >= capacity) {
      _write = 0;
    }
  }

  T? get() {
    if (buffer[_read] != null) {
      _size--;
      T? returnValue = buffer[_read];
      buffer[_read] = null;
      _read++;
      if (_read >= capacity) _read = 0;
      return returnValue;
    }
    return null;
  }

  List<T> toList() {
    List<T> values = [];
    int tempRead = _read;
    int count = _size;

    while (count > 0) {
      if (buffer[tempRead] != null) {
        values.add(buffer[tempRead] as T);
      }
      tempRead = (tempRead + 1) % capacity;
      count--;
    }
    return values;
  }

  bool isEmpty() {
    if (_size == 0) return true;
    return false;
  }

  bool isFull() {
    if (_size == capacity) {
      return true;
    }
    return false;
  }

  void clearBuffer() {
    _size = 0;
    _read = 0;
    _write = 0;
    buffer = List.filled(capacity, null);
  }

  T? peek() {
    if (!isEmpty()) {
      return buffer[_read];
    }
    return null;
  }
}
