import 'dart:math';

import 'package:shadcn_flutter/shadcn_flutter.dart';

extension ColorExtension on Color {
  Color scaleAlpha(double factor) {
    return withValues(
      alpha: a * factor,
    );
  }

  Color getContrastColor([double luminanceContrast = 1]) {
    assert(luminanceContrast >= 0 && luminanceContrast <= 1, 'luminanceContrast should be between 0 and 1');
    final hsl = HSLColor.fromColor(this);
    double currentLuminance = hsl.lightness;
    double targetLuminance;
    if (currentLuminance >= 0.5) {
      targetLuminance = currentLuminance - (currentLuminance * luminanceContrast);
    } else {
      targetLuminance = currentLuminance + ((1 - currentLuminance) * luminanceContrast);
    }
    return hsl.withLightness(targetLuminance).toColor();
  }

  Color withLuminance(double luminance) {
    final hsl = HSLColor.fromColor(this);
    return hsl.withLightness(luminance).toColor();
  }

  String toHex({bool includeHashSign = false, bool includeAlpha = true}) {
    String hex = value.toRadixString(16).padLeft(8, '0');
    if (!includeAlpha) {
      hex = hex.substring(2);
    }
    if (includeHashSign) {
      hex = '#$hex';
    }
    return hex;
  }

  HSLColor toHSL() {
    return HSLColor.fromColor(this);
  }

  HSVColor toHSV() {
    return HSVColor.fromColor(this);
  }
}

extension HSLColorExtension on HSLColor {
  HSVColor toHSV() {
    final double l = lightness;
    final double s = saturation;
    final double h = hue;
    final double a = alpha;
    final double v = l + s * min(l, 1 - l);
    double newH;
    double newS;
    if (v == 0) {
      newH = 0;
      newS = 0;
    } else {
      newS = 2 * (1 - l / v);
      newH = h;
    }
    return HSVColor.fromAHSV(a, newH, newS, v);
  }
}

extension HSVColorExtension on HSVColor {
  HSLColor toHSL() {
    final double v = value;
    final double s = saturation;
    final double h = hue;
    final double a = alpha;
    final double l = v * (1 - s / 2);
    double newH;
    double newS;
    if (l == 0 || l == 1) {
      newH = 0;
      newS = 0;
    } else {
      newS = (v - l) / min(l, 1 - l);
      newH = h;
    }
    return HSLColor.fromAHSL(a, newH, newS, l);
  }
}
