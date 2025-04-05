typedef Convert<F, T> = T Function(F value);

class BiDirectionalConvert<A, B> {
  final Convert<A, B> aToB;
  final Convert<B, A> bToA;

  const BiDirectionalConvert(this.aToB, this.bToA);

  B convertA(A value) => aToB(value);

  A convertB(B value) => bToA(value);

  @override
  String toString() {
    return 'BiDirectionalConvert($aToB, $bToA)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BiDirectionalConvert<A, B> && other.aToB == aToB && other.bToA == bToA;
  }
}
