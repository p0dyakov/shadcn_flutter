import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:shadcn_flutter/src/util/time_of_day.dart';

typedef ReplacementInfo = (int start, String newText);

ReplacementInfo replaceWordAtCaret(String text, int caret, String replacement, [String separator = ' ']) {
  if (caret < 0 || caret > text.length) {
    throw RangeError('Caret position is out of bounds.');
  }

  int start = caret;
  while (start > 0 && !separator.contains(text[start - 1])) {
    start--;
  }

  int end = caret;
  while (end < text.length && !separator.contains(text[end])) {
    end++;
  }

  String newText = text.replaceRange(start, end, replacement);
  return (start, newText);
}

void clearActiveTextInput() {
  TextFieldClearIntent intent = const TextFieldClearIntent();
  invokeActionOnFocusedWidget(intent);
}
