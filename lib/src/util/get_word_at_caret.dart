typedef WordInfo = (int start, String word);

WordInfo getWordAtCaret(String text, int caret, [String separator = ' ']) {
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

  String word = text.substring(start, end);
  return (start, word);
}
