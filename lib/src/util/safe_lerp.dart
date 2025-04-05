class SafeLerp<T> {
  final T? Function(T? a, T? b, double t) nullableLerp;

  const SafeLerp(this.nullableLerp);

  T lerp(T a, T b, double t) {
    T? result = nullableLerp(a, b, t);
    assert(result != null, 'Unsafe lerp');
    return result!;
  }
}
