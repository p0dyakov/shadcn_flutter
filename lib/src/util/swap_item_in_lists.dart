import 'package:shadcn_flutter/shadcn_flutter.dart';

void swapItemInLists<T>(List<List<T>> lists, T element, List<T> targetList, int targetIndex) {
  for (var list in lists) {
    if (list != targetList) {
      list.remove(element);
    }
  }
  targetList.swapItem(element, targetIndex);
}
