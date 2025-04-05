extension SafeLerpExtension<T> on T? Function(T? a, T? b, double t) {
  T nonNull(T a, T b, double t) {
    T? result = this(a, b, t);
    assert(result != null);
    return result!;
  }
}
