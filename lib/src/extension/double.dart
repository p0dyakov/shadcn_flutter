extension DoubleExtension on double {
  double min(double other) => this < other ? this : other;
  double max(double other) => this > other ? this : other;
}
