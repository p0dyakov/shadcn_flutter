import 'dart:ui';

import 'package:shadcn_flutter/shadcn_flutter.dart';

class Radiuses {
  final double scaling;

  /// Radius 4
  late final double r1;

  /// Radius 8
  late final double r2;

  /// Radius 12
  late final double r3;

  /// Radius 16
  late final double r4;

  /// Radius 20
  late final double r5;

  /// Radius 24
  late final double r6;

  Radiuses({
    this.scaling = 1.0,
    double r1 = 4,
    double r2 = 8,
    double r3 = 12,
    double r4 = 16,
    double r5 = 20,
    double r6 = 24,
  }) {
    this.r1 = r1 * scaling;
    this.r2 = r2 * scaling;
    this.r3 = r3 * scaling;
    this.r4 = r4 * scaling;
    this.r5 = r5 * scaling;
    this.r6 = r6 * scaling;
  }

  /// Radius 4
  BorderRadius get r1Circular => BorderRadius.circular(r1);

  /// Radius 8
  BorderRadius get r2Circular => BorderRadius.circular(r2);

  /// Radius 12
  BorderRadius get r3Circular => BorderRadius.circular(r3);

  /// Radius 16
  BorderRadius get r4Circular => BorderRadius.circular(r4);

  /// Radius 20
  BorderRadius get r5Circular => BorderRadius.circular(r5);

  /// Radius 24
  BorderRadius get r6Circular => BorderRadius.circular(r6);

  Radiuses copyWith({
    double? scaling,
    double? r1,
    double? r2,
    double? r3,
    double? r4,
    double? r5,
    double? r6,
  }) {
    return Radiuses(
      scaling: scaling ?? this.scaling,
      r1: r1 ?? this.r1,
      r2: r2 ?? this.r2,
      r3: r3 ?? this.r3,
      r4: r4 ?? this.r4,
      r5: r5 ?? this.r5,
      r6: r6 ?? this.r6,
    );
  }

  static Radiuses lerp(Radiuses a, Radiuses b, double t) {
    return Radiuses(
      scaling: lerpDouble(a.scaling, b.scaling, t)!,
      r1: lerpDouble(a.r1, b.r1, t)!,
      r2: lerpDouble(a.r2, b.r2, t)!,
      r3: lerpDouble(a.r3, b.r3, t)!,
      r4: lerpDouble(a.r4, b.r4, t)!,
      r5: lerpDouble(a.r5, b.r5, t)!,
      r6: lerpDouble(a.r6, b.r6, t)!,
    );
  }
}
