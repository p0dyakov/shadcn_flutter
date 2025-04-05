import 'package:shadcn_flutter/shadcn_flutter.dart';

class Icons {
  final double scaling;
  late final IconThemeData s1;
  late final IconThemeData s2;
  late final IconThemeData s3;
  late final IconThemeData s4;
  late final IconThemeData s5;
  late final IconThemeData s6;
  late final IconThemeData s7;
  late final IconThemeData s8;
  late final IconThemeData s9;
  late final IconThemeData s10;
  late final IconThemeData s11;

  Icons({
    this.scaling = 1.0,
    IconThemeData s1 = const IconThemeData(size: 6),
    IconThemeData s2 = const IconThemeData(size: 8),
    IconThemeData s3 = const IconThemeData(size: 10),
    IconThemeData s4 = const IconThemeData(size: 12),
    IconThemeData s5 = const IconThemeData(size: 16),
    IconThemeData s6 = const IconThemeData(size: 24),
    IconThemeData s7 = const IconThemeData(size: 32),
    IconThemeData s8 = const IconThemeData(size: 40),
    IconThemeData s9 = const IconThemeData(size: 48),
    IconThemeData s10 = const IconThemeData(size: 56),
    IconThemeData s11 = const IconThemeData(size: 64),
  }) {
    this.s1 = s1.copyWith(size: s1.size! * scaling);
    this.s2 = s2.copyWith(size: s2.size! * scaling);
    this.s3 = s3.copyWith(size: s3.size! * scaling);
    this.s4 = s4.copyWith(size: s4.size! * scaling);
    this.s5 = s5.copyWith(size: s5.size! * scaling);
    this.s6 = s6.copyWith(size: s6.size! * scaling);
    this.s7 = s7.copyWith(size: s7.size! * scaling);
    this.s8 = s8.copyWith(size: s8.size! * scaling);
    this.s9 = s9.copyWith(size: s9.size! * scaling);
    this.s10 = s10.copyWith(size: s10.size! * scaling);
    this.s11 = s11.copyWith(size: s11.size! * scaling);
  }

  Icons copyWith({
    double? scaling,
    IconThemeData? s1,
    IconThemeData? s2,
    IconThemeData? s3,
    IconThemeData? s4,
    IconThemeData? s5,
    IconThemeData? s6,
    IconThemeData? s7,
    IconThemeData? s8,
    IconThemeData? s9,
    IconThemeData? s10,
    IconThemeData? s11,
  }) {
    return Icons(
      scaling: scaling ?? this.scaling,
      s1: s1 ?? this.s1,
      s2: s2 ?? this.s2,
      s3: s3 ?? this.s3,
      s4: s4 ?? this.s4,
      s5: s5 ?? this.s5,
      s6: s6 ?? this.s6,
      s7: s7 ?? this.s7,
      s8: s8 ?? this.s8,
      s9: s9 ?? this.s9,
      s10: s10 ?? this.s10,
      s11: s11 ?? this.s11,
    );
  }

  static Icons lerp(
    Icons a,
    Icons b,
    double t,
  ) {
    return Icons(
      s1: IconThemeData.lerp(a.s1, b.s1, t),
      s2: IconThemeData.lerp(a.s2, b.s2, t),
      s3: IconThemeData.lerp(a.s3, b.s3, t),
      s4: IconThemeData.lerp(a.s4, b.s4, t),
      s5: IconThemeData.lerp(a.s5, b.s5, t),
      s6: IconThemeData.lerp(a.s6, b.s6, t),
      s7: IconThemeData.lerp(a.s7, b.s7, t),
      s8: IconThemeData.lerp(a.s8, b.s8, t),
      s9: IconThemeData.lerp(a.s9, b.s9, t),
      s10: IconThemeData.lerp(a.s10, b.s10, t),
      s11: IconThemeData.lerp(a.s11, b.s11, t),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Icons &&
        other.s1 == s1 &&
        other.s2 == s2 &&
        other.s3 == s3 &&
        other.s4 == s4 &&
        other.s5 == s5 &&
        other.s6 == s6 &&
        other.s7 == s7 &&
        other.s8 == s8 &&
        other.s9 == s9 &&
        other.s10 == s10 &&
        other.s11 == s11;
  }

  @override
  int get hashCode {
    return Object.hash(
      s1,
      s2,
      s3,
      s4,
      s5,
      s6,
      s7,
      s8,
      s9,
      s10,
      s11,
    );
  }

  @override
  String toString() {
    return 'IconThemeProperties(s1: $s1, s2: $s2, s3: $s3, s4: $s4, s5: $s5, s6: $s6, s7: $s7, s8: $s8, s9: $s9, s10: $s10, s11: $s11)';
  }
}
