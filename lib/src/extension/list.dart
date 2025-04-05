import 'package:shadcn_flutter/shadcn_flutter.dart';

extension Joinable<T extends Widget> on List<T> {
  List<T> joinSeparator(T separator) {
    List<T> result = [];
    for (int i = 0; i < length; i++) {
      if (i > 0) {
        result.add(separator);
      }
      result.add(this[i]);
    }
    return result;
  }
}

extension ListExtension<T> on List<T> {
  int? indexOfOrNull(T obj, [int start = 0]) {
    int index = indexOf(obj, start);
    return index == -1 ? null : index;
  }

  int? lastIndexOfOrNull(T obj, [int? start]) {
    int index = lastIndexOf(obj, start);
    return index == -1 ? null : index;
  }

  int? indexWhereOrNull(Predicate<T> test, [int start = 0]) {
    int index = indexWhere(test, start);
    return index == -1 ? null : index;
  }

  int? lastIndexWhereOrNull(Predicate<T> test, [int? start]) {
    int index = lastIndexWhere(test, start);
    return index == -1 ? null : index;
  }

  bool swapItem(T element, int targetIndex) {
    int currentIndex = indexOf(element);
    if (currentIndex == -1) {
      insert(targetIndex, element);
      return true;
    }
    if (currentIndex == targetIndex) {
      return true;
    }
    if (targetIndex >= length) {
      remove(element);
      add(element);
      return true;
    }
    removeAt(currentIndex);
    if (currentIndex < targetIndex) {
      insert(targetIndex - 1, element);
    } else {
      insert(targetIndex, element);
    }
    return true;
  }

  bool swapItemWhere(Predicate<T> test, int targetIndex) {
    int currentIndex = indexWhere(test);
    if (currentIndex == -1) {
      return false;
    }
    T element = this[currentIndex];
    return swapItem(element, targetIndex);
  }

  T? optGet(int index) {
    if (index < 0 || index >= length) {
      return null;
    }
    return this[index];
  }
}
