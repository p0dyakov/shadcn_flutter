import '../../shadcn_flutter.dart';

class Typography {
  final double scaling;
  late final TextStyle s1;
  late final TextStyle s2;
  late final TextStyle s3;
  late final TextStyle s4;
  late final TextStyle s5;
  late final TextStyle s6;
  late final TextStyle s7;
  late final TextStyle s8;
  late final TextStyle s9;
  late final TextStyle s10;
  late final TextStyle s11;
  late final TextStyle s12;
  late final TextStyle s13;
  final TextStyle w1;
  final TextStyle w2;
  final TextStyle w3;
  final TextStyle w4;
  final TextStyle w5;
  final TextStyle w6;
  final TextStyle w7;
  final TextStyle w8;
  final TextStyle w9;
  final TextStyle sans;
  final TextStyle mono;
  final TextStyle italic;
  final TextStyle quote;
  final TextStyle code;

  Typography.geist({
    this.scaling = 1,
    TextStyle s1 = const TextStyle(fontSize: 12),
    TextStyle s2 = const TextStyle(fontSize: 14),
    TextStyle s3 = const TextStyle(fontSize: 16),
    TextStyle s4 = const TextStyle(fontSize: 18),
    TextStyle s5 = const TextStyle(fontSize: 20),
    TextStyle s6 = const TextStyle(fontSize: 24),
    TextStyle s7 = const TextStyle(fontSize: 30),
    TextStyle s8 = const TextStyle(fontSize: 36),
    TextStyle s9 = const TextStyle(fontSize: 48),
    TextStyle s10 = const TextStyle(fontSize: 60),
    TextStyle s11 = const TextStyle(fontSize: 72),
    TextStyle s12 = const TextStyle(fontSize: 96),
    TextStyle s13 = const TextStyle(fontSize: 144),
    this.w1 = const TextStyle(fontWeight: FontWeight.w100),
    this.w2 = const TextStyle(fontWeight: FontWeight.w200),
    this.w3 = const TextStyle(fontWeight: FontWeight.w300),
    this.w4 = const TextStyle(fontWeight: FontWeight.w400),
    this.w5 = const TextStyle(fontWeight: FontWeight.w500),
    this.w6 = const TextStyle(fontWeight: FontWeight.w600),
    this.w7 = const TextStyle(fontWeight: FontWeight.w700),
    this.w8 = const TextStyle(fontWeight: FontWeight.w800),
    this.w9 = const TextStyle(fontWeight: FontWeight.w900),
    this.sans = const TextStyle(fontFamily: 'GeistSans', package: 'shadcn_flutter'),
    this.mono = const TextStyle(fontFamily: 'GeistMono', package: 'shadcn_flutter'),
    this.italic = const TextStyle(fontStyle: FontStyle.italic),
    this.quote = const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic),
    this.code =
        const TextStyle(fontFamily: 'GeistMono', fontSize: 14, fontWeight: FontWeight.w600, package: 'shadcn_flutter'),
  }) {
    this.s1 = s1.copyWith(fontSize: s1.fontSize! * scaling);
    this.s2 = s2.copyWith(fontSize: s2.fontSize! * scaling);
    this.s3 = s3.copyWith(fontSize: s3.fontSize! * scaling);
    this.s4 = s4.copyWith(fontSize: s4.fontSize! * scaling);
    this.s5 = s5.copyWith(fontSize: s5.fontSize! * scaling);
    this.s6 = s6.copyWith(fontSize: s6.fontSize! * scaling);
    this.s7 = s7.copyWith(fontSize: s7.fontSize! * scaling);
    this.s8 = s8.copyWith(fontSize: s8.fontSize! * scaling);
    this.s9 = s9.copyWith(fontSize: s9.fontSize! * scaling);
    this.s10 = s10.copyWith(fontSize: s10.fontSize! * scaling);
    this.s11 = s11.copyWith(fontSize: s11.fontSize! * scaling);
    this.s12 = s12.copyWith(fontSize: s12.fontSize! * scaling);
    this.s13 = s13.copyWith(fontSize: s13.fontSize! * scaling);
  }

  Typography({
    this.scaling = 1,
    TextStyle s1 = const TextStyle(fontSize: 12),
    TextStyle s2 = const TextStyle(fontSize: 14),
    TextStyle s3 = const TextStyle(fontSize: 16),
    TextStyle s4 = const TextStyle(fontSize: 18),
    TextStyle s5 = const TextStyle(fontSize: 20),
    TextStyle s6 = const TextStyle(fontSize: 24),
    TextStyle s7 = const TextStyle(fontSize: 30),
    TextStyle s8 = const TextStyle(fontSize: 36),
    TextStyle s9 = const TextStyle(fontSize: 48),
    TextStyle s10 = const TextStyle(fontSize: 60),
    TextStyle s11 = const TextStyle(fontSize: 72),
    TextStyle s12 = const TextStyle(fontSize: 96),
    TextStyle s13 = const TextStyle(fontSize: 144),
    this.w1 = const TextStyle(fontWeight: FontWeight.w100),
    this.w2 = const TextStyle(fontWeight: FontWeight.w200),
    this.w3 = const TextStyle(fontWeight: FontWeight.w300),
    this.w4 = const TextStyle(fontWeight: FontWeight.w400),
    this.w5 = const TextStyle(fontWeight: FontWeight.w500),
    this.w6 = const TextStyle(fontWeight: FontWeight.w600),
    this.w7 = const TextStyle(fontWeight: FontWeight.w700),
    this.w8 = const TextStyle(fontWeight: FontWeight.w800),
    this.w9 = const TextStyle(fontWeight: FontWeight.w900),
    this.sans = const TextStyle(package: 'shadcn_flutter'),
    this.mono = const TextStyle(package: 'shadcn_flutter'),
    this.italic = const TextStyle(fontStyle: FontStyle.italic),
    this.quote = const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic),
    this.code = const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, package: 'shadcn_flutter'),
  }) {
    this.s1 = s1.copyWith(fontSize: s1.fontSize! * scaling);
    this.s2 = s2.copyWith(fontSize: s2.fontSize! * scaling);
    this.s3 = s3.copyWith(fontSize: s3.fontSize! * scaling);
    this.s4 = s4.copyWith(fontSize: s4.fontSize! * scaling);
    this.s5 = s5.copyWith(fontSize: s5.fontSize! * scaling);
    this.s6 = s6.copyWith(fontSize: s6.fontSize! * scaling);
    this.s7 = s7.copyWith(fontSize: s7.fontSize! * scaling);
    this.s8 = s8.copyWith(fontSize: s8.fontSize! * scaling);
    this.s9 = s9.copyWith(fontSize: s9.fontSize! * scaling);
    this.s10 = s10.copyWith(fontSize: s10.fontSize! * scaling);
    this.s11 = s11.copyWith(fontSize: s11.fontSize! * scaling);
    this.s12 = s12.copyWith(fontSize: s12.fontSize! * scaling);
    this.s13 = s13.copyWith(fontSize: s13.fontSize! * scaling);
  }

  Typography copyWith({
    TextStyle? sans,
    TextStyle? mono,
    TextStyle? s1,
    TextStyle? s2,
    TextStyle? s3,
    TextStyle? s4,
    TextStyle? s5,
    TextStyle? s6,
    TextStyle? s7,
    TextStyle? s8,
    TextStyle? s9,
    TextStyle? s10,
    TextStyle? s11,
    TextStyle? s12,
    TextStyle? s13,
    TextStyle? w1,
    TextStyle? w3,
    TextStyle? w2,
    TextStyle? w4,
    TextStyle? w5,
    TextStyle? w6,
    TextStyle? w7,
    TextStyle? w8,
    TextStyle? w9,
    TextStyle? italic,
    TextStyle? quote,
    TextStyle? code,
  }) {
    return Typography(
      sans: sans ?? this.sans,
      mono: mono ?? this.mono,
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
      s12: s12 ?? this.s12,
      s13: s13 ?? this.s13,
      w1: w1 ?? this.w1,
      w3: w3 ?? this.w3,
      w2: w2 ?? this.w2,
      w4: w4 ?? this.w4,
      w5: w5 ?? this.w5,
      w6: w6 ?? this.w6,
      w7: w7 ?? this.w7,
      w8: w8 ?? this.w8,
      w9: w9 ?? this.w9,
      italic: italic ?? this.italic,
      quote: quote ?? this.quote,
      code: code ?? this.code,
    );
  }

  static Typography lerp(Typography a, Typography b, double t) {
    return Typography(
      sans: TextStyle.lerp(a.sans, b.sans, t)!,
      mono: TextStyle.lerp(a.mono, b.mono, t)!,
      s1: TextStyle.lerp(a.s1, b.s1, t)!,
      s2: TextStyle.lerp(a.s2, b.s2, t)!,
      s3: TextStyle.lerp(a.s3, b.s3, t)!,
      s4: TextStyle.lerp(a.s4, b.s4, t)!,
      s5: TextStyle.lerp(a.s5, b.s5, t)!,
      s6: TextStyle.lerp(a.s6, b.s6, t)!,
      s7: TextStyle.lerp(a.s7, b.s7, t)!,
      s8: TextStyle.lerp(a.s8, b.s8, t)!,
      s9: TextStyle.lerp(a.s9, b.s9, t)!,
      s10: TextStyle.lerp(a.s10, b.s10, t)!,
      s11: TextStyle.lerp(a.s11, b.s11, t)!,
      s12: TextStyle.lerp(a.s12, b.s12, t)!,
      s13: TextStyle.lerp(a.s13, b.s13, t)!,
      w1: TextStyle.lerp(a.w1, b.w1, t)!,
      w3: TextStyle.lerp(a.w3, b.w3, t)!,
      w2: TextStyle.lerp(a.w2, b.w2, t)!,
      w4: TextStyle.lerp(a.w4, b.w4, t)!,
      w5: TextStyle.lerp(a.w5, b.w5, t)!,
      w6: TextStyle.lerp(a.w6, b.w6, t)!,
      w7: TextStyle.lerp(a.w7, b.w7, t)!,
      w8: TextStyle.lerp(a.w8, b.w8, t)!,
      w9: TextStyle.lerp(a.w9, b.w9, t)!,
      italic: TextStyle.lerp(a.italic, b.italic, t)!,
      quote: TextStyle.lerp(a.quote, b.quote, t)!,
      code: TextStyle.lerp(a.code, b.code, t)!,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Typography &&
          sans == other.sans &&
          mono == other.mono &&
          s1 == other.s1 &&
          s2 == other.s2 &&
          s3 == other.s3 &&
          s4 == other.s4 &&
          s5 == other.s5 &&
          s6 == other.s6 &&
          s7 == other.s7 &&
          s8 == other.s8 &&
          s9 == other.s9 &&
          s10 == other.s10 &&
          s11 == other.s11 &&
          s12 == other.s12 &&
          s13 == other.s13 &&
          w1 == other.w1 &&
          w3 == other.w3 &&
          w2 == other.w2 &&
          w4 == other.w4 &&
          w5 == other.w5 &&
          w6 == other.w6 &&
          w7 == other.w7 &&
          w8 == other.w8 &&
          w9 == other.w9 &&
          italic == other.italic &&
          quote == other.quote &&
          code == other.code;

  @override
  int get hashCode =>
      sans.hashCode ^
      mono.hashCode ^
      s1.hashCode ^
      s2.hashCode ^
      s3.hashCode ^
      s4.hashCode ^
      s5.hashCode ^
      s6.hashCode ^
      s7.hashCode ^
      s8.hashCode ^
      s9.hashCode ^
      s10.hashCode ^
      s11.hashCode ^
      s12.hashCode ^
      s13.hashCode ^
      w1.hashCode ^
      w3.hashCode ^
      w2.hashCode ^
      w4.hashCode ^
      w5.hashCode ^
      w6.hashCode ^
      w7.hashCode ^
      w8.hashCode ^
      w9.hashCode ^
      italic.hashCode ^
      quote.hashCode ^
      code.hashCode;

  @override
  String toString() {
    return 'Typography(sans: $sans, mono: $mono, s1: $s1, s2: $s2, s3: $s3, s4: $s4, s5: $s5, s6: $s6, s7: $s7, s8: $s8, s9: $s9, s10: $s10, s11: $s11, s12: $s12, s13: $s13, w1: $w1, w3: $w3, w2: $w2, w4: $w4, w5: $w5, w6: $w6, w7: $w7, w8: $w8, w9: $w9, italic: $italic, quote: $quote, code: $code)';
  }
}
