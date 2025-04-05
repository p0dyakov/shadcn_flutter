double wrapDouble(double value, double min, double max) {
  final range = max - min;
  if (range == 0) {
    return min;
  }
  return (value - min) % range + min;
}
