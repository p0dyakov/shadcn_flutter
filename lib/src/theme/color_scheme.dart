import '../../shadcn_flutter.dart';
import 'dart:ui';

class SingleChartColorScheme implements ChartColorScheme {
  final Color color;

  const SingleChartColorScheme(this.color);

  @override
  List<Color> get chartColors => [color, color, color, color, color];

  @override
  Color get chart1 => color;

  @override
  Color get chart2 => color;

  @override
  Color get chart3 => color;

  @override
  Color get chart4 => color;

  @override
  Color get chart5 => color;
}

class ChartColorScheme {
  final List<Color> chartColors;

  const ChartColorScheme(this.chartColors);

  factory ChartColorScheme.single(Color color) {
    return SingleChartColorScheme(color);
  }

  Color get chart1 => chartColors[0];
  Color get chart2 => chartColors[1];
  Color get chart3 => chartColors[2];
  Color get chart4 => chartColors[3];
  Color get chart5 => chartColors[4];
}

String hexFromColor(Color color) {
  return '#${color.value.toRadixString(16).toUpperCase()}';
}

class ColorScheme implements ChartColorScheme {
  static const Set<String> colorKeys = {
    'background',
    'foreground',
    'card',
    'cardForeground',
    'popover',
    'popoverForeground',
    'primary',
    'primaryForeground',
    'secondary',
    'secondaryForeground',
    'muted',
    'mutedForeground',
    'accent',
    'accentForeground',
    'destructive',
    'destructiveForeground',
    'border',
    'input',
    'ring',
    'chart1',
    'chart2',
    'chart3',
    'chart4',
    'chart5',
  };
  final Brightness brightness;
  final Color background;
  final Color foreground;
  final Color card;
  final Color cardForeground;
  final Color popover;
  final Color popoverForeground;
  final Color primary;
  final Color primaryForeground;
  final Color secondary;
  final Color secondaryForeground;
  final Color muted;
  final Color mutedForeground;
  final Color accent;
  final Color accentForeground;
  final Color destructive;
  final Color destructiveForeground;
  final Color border;
  final Color input;
  final Color ring;
  @override
  final Color chart1;
  @override
  final Color chart2;
  @override
  final Color chart3;
  @override
  final Color chart4;
  @override
  final Color chart5;

  const ColorScheme({
    required this.brightness,
    required this.background,
    required this.foreground,
    required this.card,
    required this.cardForeground,
    required this.popover,
    required this.popoverForeground,
    required this.primary,
    required this.primaryForeground,
    required this.secondary,
    required this.secondaryForeground,
    required this.muted,
    required this.mutedForeground,
    required this.accent,
    required this.accentForeground,
    required this.destructive,
    required this.destructiveForeground,
    required this.border,
    required this.input,
    required this.ring,
    required this.chart1,
    required this.chart2,
    required this.chart3,
    required this.chart4,
    required this.chart5,
  });

  ColorScheme.fromMap(Map<String, dynamic> map)
      : background = map._col('background'),
        foreground = map._col('foreground'),
        card = map._col('card'),
        cardForeground = map._col('cardForeground'),
        popover = map._col('popover'),
        popoverForeground = map._col('popoverForeground'),
        primary = map._col('primary'),
        primaryForeground = map._col('primaryForeground'),
        secondary = map._col('secondary'),
        secondaryForeground = map._col('secondaryForeground'),
        muted = map._col('muted'),
        mutedForeground = map._col('mutedForeground'),
        accent = map._col('accent'),
        accentForeground = map._col('accentForeground'),
        destructive = map._col('destructive'),
        destructiveForeground = map._col('destructiveForeground'),
        border = map._col('border'),
        input = map._col('input'),
        ring = map._col('ring'),
        chart1 = map._col('chart1'),
        chart2 = map._col('chart2'),
        chart3 = map._col('chart3'),
        chart4 = map._col('chart4'),
        chart5 = map._col('chart5'),
        brightness =
            Brightness.values.where((element) => element.name == map['brightness']).firstOrNull ?? Brightness.light;

  Map<String, String> toMap() {
    return {
      'background': hexFromColor(background),
      'foreground': hexFromColor(foreground),
      'card': hexFromColor(card),
      'cardForeground': hexFromColor(cardForeground),
      'popover': hexFromColor(popover),
      'popoverForeground': hexFromColor(popoverForeground),
      'primary': hexFromColor(primary),
      'primaryForeground': hexFromColor(primaryForeground),
      'secondary': hexFromColor(secondary),
      'secondaryForeground': hexFromColor(secondaryForeground),
      'muted': hexFromColor(muted),
      'mutedForeground': hexFromColor(mutedForeground),
      'accent': hexFromColor(accent),
      'accentForeground': hexFromColor(accentForeground),
      'destructive': hexFromColor(destructive),
      'destructiveForeground': hexFromColor(destructiveForeground),
      'border': hexFromColor(border),
      'input': hexFromColor(input),
      'ring': hexFromColor(ring),
      'chart1': hexFromColor(chart1),
      'chart2': hexFromColor(chart2),
      'chart3': hexFromColor(chart3),
      'chart4': hexFromColor(chart4),
      'chart5': hexFromColor(chart5),
      'brightness': brightness.name,
    };
  }

  Map<String, Color> toColorMap() {
    return {
      'background': background,
      'foreground': foreground,
      'card': card,
      'cardForeground': cardForeground,
      'popover': popover,
      'popoverForeground': popoverForeground,
      'primary': primary,
      'primaryForeground': primaryForeground,
      'secondary': secondary,
      'secondaryForeground': secondaryForeground,
      'muted': muted,
      'mutedForeground': mutedForeground,
      'accent': accent,
      'accentForeground': accentForeground,
      'destructive': destructive,
      'destructiveForeground': destructiveForeground,
      'border': border,
      'input': input,
      'ring': ring,
      'chart1': chart1,
      'chart2': chart2,
      'chart3': chart3,
      'chart4': chart4,
      'chart5': chart5,
    };
  }

  ColorScheme.fromColors({
    required Map<String, Color> colors,
    required Brightness brightness,
  }) : this(
          brightness: brightness,
          background: colors._col('background'),
          foreground: colors._col('foreground'),
          card: colors._col('card'),
          cardForeground: colors._col('cardForeground'),
          popover: colors._col('popover'),
          popoverForeground: colors._col('popoverForeground'),
          primary: colors._col('primary'),
          primaryForeground: colors._col('primaryForeground'),
          secondary: colors._col('secondary'),
          secondaryForeground: colors._col('secondaryForeground'),
          muted: colors._col('muted'),
          mutedForeground: colors._col('mutedForeground'),
          accent: colors._col('accent'),
          accentForeground: colors._col('accentForeground'),
          destructive: colors._col('destructive'),
          destructiveForeground: colors._col('destructiveForeground'),
          border: colors._col('border'),
          input: colors._col('input'),
          ring: colors._col('ring'),
          chart1: colors._col('chart1'),
          chart2: colors._col('chart2'),
          chart3: colors._col('chart3'),
          chart4: colors._col('chart4'),
          chart5: colors._col('chart5'),
        );

  ColorScheme copyWith({
    Brightness? brightness,
    Color? background,
    Color? foreground,
    Color? card,
    Color? cardForeground,
    Color? popover,
    Color? popoverForeground,
    Color? primary,
    Color? primaryForeground,
    Color? secondary,
    Color? secondaryForeground,
    Color? muted,
    Color? mutedForeground,
    Color? accent,
    Color? accentForeground,
    Color? destructive,
    Color? destructiveForeground,
    Color? border,
    Color? input,
    Color? ring,
  }) {
    return ColorScheme(
      brightness: brightness ?? this.brightness,
      background: background ?? this.background,
      foreground: foreground ?? this.foreground,
      card: card ?? this.card,
      cardForeground: cardForeground ?? this.cardForeground,
      popover: popover ?? this.popover,
      popoverForeground: popoverForeground ?? this.popoverForeground,
      primary: primary ?? this.primary,
      primaryForeground: primaryForeground ?? this.primaryForeground,
      secondary: secondary ?? this.secondary,
      secondaryForeground: secondaryForeground ?? this.secondaryForeground,
      muted: muted ?? this.muted,
      mutedForeground: mutedForeground ?? this.mutedForeground,
      accent: accent ?? this.accent,
      accentForeground: accentForeground ?? this.accentForeground,
      destructive: destructive ?? this.destructive,
      destructiveForeground: destructiveForeground ?? this.destructiveForeground,
      border: border ?? this.border,
      input: input ?? this.input,
      ring: ring ?? this.ring,
      chart1: chart1,
      chart2: chart2,
      chart3: chart3,
      chart4: chart4,
      chart5: chart5,
    );
  }

  @override
  List<Color> get chartColors => [chart1, chart2, chart3, chart4, chart5];

  static ColorScheme lerp(ColorScheme a, ColorScheme b, double t) {
    return ColorScheme(
      brightness: t < 0.5 ? a.brightness : b.brightness,
      background: Color.lerp(a.background, b.background, t)!,
      foreground: Color.lerp(a.foreground, b.foreground, t)!,
      card: Color.lerp(a.card, b.card, t)!,
      cardForeground: Color.lerp(a.cardForeground, b.cardForeground, t)!,
      popover: Color.lerp(a.popover, b.popover, t)!,
      popoverForeground: Color.lerp(a.popoverForeground, b.popoverForeground, t)!,
      primary: Color.lerp(a.primary, b.primary, t)!,
      primaryForeground: Color.lerp(a.primaryForeground, b.primaryForeground, t)!,
      secondary: Color.lerp(a.secondary, b.secondary, t)!,
      secondaryForeground: Color.lerp(a.secondaryForeground, b.secondaryForeground, t)!,
      muted: Color.lerp(a.muted, b.muted, t)!,
      mutedForeground: Color.lerp(a.mutedForeground, b.mutedForeground, t)!,
      accent: Color.lerp(a.accent, b.accent, t)!,
      accentForeground: Color.lerp(a.accentForeground, b.accentForeground, t)!,
      destructive: Color.lerp(a.destructive, b.destructive, t)!,
      destructiveForeground: Color.lerp(a.destructiveForeground, b.destructiveForeground, t)!,
      border: Color.lerp(a.border, b.border, t)!,
      input: Color.lerp(a.input, b.input, t)!,
      ring: Color.lerp(a.ring, b.ring, t)!,
      chart1: Color.lerp(a.chart1, b.chart1, t)!,
      chart2: Color.lerp(a.chart2, b.chart2, t)!,
      chart3: Color.lerp(a.chart3, b.chart3, t)!,
      chart4: Color.lerp(a.chart4, b.chart4, t)!,
      chart5: Color.lerp(a.chart5, b.chart5, t)!,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorScheme &&
          runtimeType == other.runtimeType &&
          brightness == other.brightness &&
          background == other.background &&
          foreground == other.foreground &&
          card == other.card &&
          cardForeground == other.cardForeground &&
          popover == other.popover &&
          popoverForeground == other.popoverForeground &&
          primary == other.primary &&
          primaryForeground == other.primaryForeground &&
          secondary == other.secondary &&
          secondaryForeground == other.secondaryForeground &&
          muted == other.muted &&
          mutedForeground == other.mutedForeground &&
          accent == other.accent &&
          accentForeground == other.accentForeground &&
          destructive == other.destructive &&
          destructiveForeground == other.destructiveForeground &&
          border == other.border &&
          input == other.input &&
          ring == other.ring &&
          chart1 == other.chart1 &&
          chart2 == other.chart2 &&
          chart3 == other.chart3 &&
          chart4 == other.chart4 &&
          chart5 == other.chart5;

  @override
  int get hashCode =>
      brightness.hashCode ^
      background.hashCode ^
      foreground.hashCode ^
      card.hashCode ^
      cardForeground.hashCode ^
      popover.hashCode ^
      popoverForeground.hashCode ^
      primary.hashCode ^
      primaryForeground.hashCode ^
      secondary.hashCode ^
      secondaryForeground.hashCode ^
      muted.hashCode ^
      mutedForeground.hashCode ^
      accent.hashCode ^
      accentForeground.hashCode ^
      destructive.hashCode ^
      destructiveForeground.hashCode ^
      border.hashCode ^
      input.hashCode ^
      ring.hashCode ^
      chart1.hashCode ^
      chart2.hashCode ^
      chart3.hashCode ^
      chart4.hashCode ^
      chart5.hashCode;

  @override
  String toString() {
    return 'ColorScheme{brightness: $brightness, background: $background, foreground: $foreground, card: $card, cardForeground: $cardForeground, popover: $popover, popoverForeground: $popoverForeground, primary: $primary, primaryForeground: $primaryForeground, secondary: $secondary, secondaryForeground: $secondaryForeground, muted: $muted, mutedForeground: $mutedForeground, accent: $accent, accentForeground: $accentForeground, destructive: $destructive, destructiveForeground: $destructiveForeground, border: $border, input: $input, ring: $ring, chart1: $chart1, chart2: $chart2, chart3: $chart3, chart4: $chart4, chart5: $chart5}';
  }
}

extension _MapColorGetter on Map<String, Color> {
  Color _col(String name) {
    Color? color = this[name];
    assert(color != null, 'ColorScheme: Missing color for $name');
    return color!;
  }
}

extension _DynamicMapColorGetter on Map<String, dynamic> {
  Color _col(String name) {
    String? value = this[name];
    assert(value != null, 'ColorScheme: Missing color for $name');
    if (value!.startsWith('#')) {
      value = value.substring(1);
    }
    if (value.length == 6) {
      value = 'FF$value';
    }
    var parse = int.tryParse(value, radix: 16);
    assert(parse != null, 'ColorScheme: Invalid hex color value $value');
    return Color(parse!);
  }
}

class ColorSchemes {
  static ColorScheme from(ThemeMode mode, PrimaryColor primaryColor) {
    switch (primaryColor) {
      case PrimaryColor.slate:
        return ColorSchemes.slate(mode);
      case PrimaryColor.gray:
        return ColorSchemes.gray(mode);
      case PrimaryColor.zinc:
        return ColorSchemes.zinc(mode);
      case PrimaryColor.neutral:
        return ColorSchemes.neutral(mode);
      case PrimaryColor.stone:
        return ColorSchemes.stone(mode);
      case PrimaryColor.red:
        return ColorSchemes.red(mode);
      case PrimaryColor.orange:
        return ColorSchemes.orange(mode);
      case PrimaryColor.yellow:
        return ColorSchemes.yellow(mode);
      case PrimaryColor.green:
        return ColorSchemes.green(mode);
      case PrimaryColor.blue:
        return ColorSchemes.blue(mode);
      case PrimaryColor.violet:
        return ColorSchemes.violet(mode);
    }
  }

  static ColorScheme lightZinc() {
    return ColorScheme(
      brightness: Brightness.light,
      background: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      foreground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      card: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      popover: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      primary: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      secondary: const HSLColor.fromAHSL(1, 240.0, 0.05, 0.96).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      muted: const HSLColor.fromAHSL(1, 240.0, 0.05, 0.96).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 240.0, 0.04, 0.46).toColor(),
      accent: const HSLColor.fromAHSL(1, 240.0, 0.05, 0.96).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.84, 0.6).toColor(),
      destructiveForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      input: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      ring: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      chart1: const HSLColor.fromAHSL(1, 12.0, 0.76, 0.61).toColor(),
      chart2: const HSLColor.fromAHSL(1, 173.0, 0.58, 0.39).toColor(),
      chart3: const HSLColor.fromAHSL(1, 197.0, 0.37, 0.24).toColor(),
      chart4: const HSLColor.fromAHSL(1, 43.0, 0.74, 0.66).toColor(),
      chart5: const HSLColor.fromAHSL(1, 27.0, 0.87, 0.67).toColor(),
    );
  }

  static ColorScheme darkZinc() {
    return ColorScheme(
      brightness: Brightness.dark,
      background: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      foreground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      card: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      popover: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      primary: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      secondary: const HSLColor.fromAHSL(1, 240.0, 0.04, 0.16).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      muted: const HSLColor.fromAHSL(1, 240.0, 0.04, 0.16).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 240.0, 0.05, 0.65).toColor(),
      accent: const HSLColor.fromAHSL(1, 240.0, 0.04, 0.16).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.63, 0.31).toColor(),
      destructiveForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 240.0, 0.04, 0.16).toColor(),
      input: const HSLColor.fromAHSL(1, 240.0, 0.04, 0.16).toColor(),
      ring: const HSLColor.fromAHSL(1, 240.0, 0.05, 0.84).toColor(),
      chart1: const HSLColor.fromAHSL(1, 220.0, 0.7, 0.5).toColor(),
      chart2: const HSLColor.fromAHSL(1, 160.0, 0.6, 0.45).toColor(),
      chart3: const HSLColor.fromAHSL(1, 30.0, 0.8, 0.55).toColor(),
      chart4: const HSLColor.fromAHSL(1, 280.0, 0.65, 0.6).toColor(),
      chart5: const HSLColor.fromAHSL(1, 340.0, 0.75, 0.55).toColor(),
    );
  }

  static ColorScheme zinc(ThemeMode mode) {
    assert(() {
      _assertNotThemeModeSystem(mode, 'Zinc');
      return true;
    }());
    return mode == ThemeMode.light ? lightZinc() : darkZinc();
  }

  static ColorScheme lightSlate() {
    return ColorScheme(
      brightness: Brightness.light,
      background: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      foreground: const HSLColor.fromAHSL(1, 222.2, 0.84, 0.05).toColor(),
      card: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 222.2, 0.84, 0.05).toColor(),
      popover: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 222.2, 0.84, 0.05).toColor(),
      primary: const HSLColor.fromAHSL(1, 222.2, 0.47, 0.11).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      secondary: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.96).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 222.2, 0.47, 0.11).toColor(),
      muted: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.96).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 215.4, 0.16, 0.47).toColor(),
      accent: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.96).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 222.2, 0.47, 0.11).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.84, 0.6).toColor(),
      destructiveForeground: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 214.3, 0.32, 0.91).toColor(),
      input: const HSLColor.fromAHSL(1, 214.3, 0.32, 0.91).toColor(),
      ring: const HSLColor.fromAHSL(1, 222.2, 0.84, 0.05).toColor(),
      chart1: const HSLColor.fromAHSL(1, 12.0, 0.76, 0.61).toColor(),
      chart2: const HSLColor.fromAHSL(1, 173.0, 0.58, 0.39).toColor(),
      chart3: const HSLColor.fromAHSL(1, 197.0, 0.37, 0.24).toColor(),
      chart4: const HSLColor.fromAHSL(1, 43.0, 0.74, 0.66).toColor(),
      chart5: const HSLColor.fromAHSL(1, 27.0, 0.87, 0.67).toColor(),
    );
  }

  static ColorScheme darkSlate() {
    return ColorScheme(
      brightness: Brightness.dark,
      background: const HSLColor.fromAHSL(1, 222.2, 0.84, 0.05).toColor(),
      foreground: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      card: const HSLColor.fromAHSL(1, 222.2, 0.84, 0.05).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      popover: const HSLColor.fromAHSL(1, 222.2, 0.84, 0.05).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      primary: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 222.2, 0.47, 0.11).toColor(),
      secondary: const HSLColor.fromAHSL(1, 217.2, 0.33, 0.18).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      muted: const HSLColor.fromAHSL(1, 217.2, 0.33, 0.18).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 215.0, 0.2, 0.65).toColor(),
      accent: const HSLColor.fromAHSL(1, 217.2, 0.33, 0.18).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.63, 0.31).toColor(),
      destructiveForeground: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 217.2, 0.33, 0.18).toColor(),
      input: const HSLColor.fromAHSL(1, 217.2, 0.33, 0.18).toColor(),
      ring: const HSLColor.fromAHSL(1, 212.7, 0.27, 0.84).toColor(),
      chart1: const HSLColor.fromAHSL(1, 220.0, 0.7, 0.5).toColor(),
      chart2: const HSLColor.fromAHSL(1, 160.0, 0.6, 0.45).toColor(),
      chart3: const HSLColor.fromAHSL(1, 30.0, 0.8, 0.55).toColor(),
      chart4: const HSLColor.fromAHSL(1, 280.0, 0.65, 0.6).toColor(),
      chart5: const HSLColor.fromAHSL(1, 340.0, 0.75, 0.55).toColor(),
    );
  }

  static ColorScheme slate(ThemeMode mode) {
    assert(() {
      _assertNotThemeModeSystem(mode, 'Slate');
      return true;
    }());
    return mode == ThemeMode.light ? lightSlate() : darkSlate();
  }

  static ColorScheme lightStone() {
    return ColorScheme(
      brightness: Brightness.light,
      background: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      foreground: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      card: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      popover: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      primary: const HSLColor.fromAHSL(1, 24.0, 0.1, 0.1).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      secondary: const HSLColor.fromAHSL(1, 60.0, 0.05, 0.96).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 24.0, 0.1, 0.1).toColor(),
      muted: const HSLColor.fromAHSL(1, 60.0, 0.05, 0.96).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 25.0, 0.05, 0.45).toColor(),
      accent: const HSLColor.fromAHSL(1, 60.0, 0.05, 0.96).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 24.0, 0.1, 0.1).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.84, 0.6).toColor(),
      destructiveForeground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 20.0, 0.06, 0.9).toColor(),
      input: const HSLColor.fromAHSL(1, 20.0, 0.06, 0.9).toColor(),
      ring: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      chart1: const HSLColor.fromAHSL(1, 12.0, 0.76, 0.61).toColor(),
      chart2: const HSLColor.fromAHSL(1, 173.0, 0.58, 0.39).toColor(),
      chart3: const HSLColor.fromAHSL(1, 197.0, 0.37, 0.24).toColor(),
      chart4: const HSLColor.fromAHSL(1, 43.0, 0.74, 0.66).toColor(),
      chart5: const HSLColor.fromAHSL(1, 27.0, 0.87, 0.67).toColor(),
    );
  }

  static ColorScheme darkStone() {
    return ColorScheme(
      brightness: Brightness.dark,
      background: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      foreground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      card: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      popover: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      primary: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 24.0, 0.1, 0.1).toColor(),
      secondary: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      muted: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 24.0, 0.05, 0.64).toColor(),
      accent: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.63, 0.31).toColor(),
      destructiveForeground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      input: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      ring: const HSLColor.fromAHSL(1, 24.0, 0.06, 0.83).toColor(),
      chart1: const HSLColor.fromAHSL(1, 220.0, 0.7, 0.5).toColor(),
      chart2: const HSLColor.fromAHSL(1, 160.0, 0.6, 0.45).toColor(),
      chart3: const HSLColor.fromAHSL(1, 30.0, 0.8, 0.55).toColor(),
      chart4: const HSLColor.fromAHSL(1, 280.0, 0.65, 0.6).toColor(),
      chart5: const HSLColor.fromAHSL(1, 340.0, 0.75, 0.55).toColor(),
    );
  }

  static ColorScheme stone(ThemeMode mode) {
    assert(() {
      _assertNotThemeModeSystem(mode, 'Stone');
      return true;
    }());
    return mode == ThemeMode.light ? lightStone() : darkStone();
  }

  static ColorScheme lightGray() {
    return ColorScheme(
      brightness: Brightness.light,
      background: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      foreground: const HSLColor.fromAHSL(1, 224.0, 0.71, 0.04).toColor(),
      card: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 224.0, 0.71, 0.04).toColor(),
      popover: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 224.0, 0.71, 0.04).toColor(),
      primary: const HSLColor.fromAHSL(1, 220.9, 0.39, 0.11).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      secondary: const HSLColor.fromAHSL(1, 220.0, 0.14, 0.96).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 220.9, 0.39, 0.11).toColor(),
      muted: const HSLColor.fromAHSL(1, 220.0, 0.14, 0.96).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 220.0, 0.09, 0.46).toColor(),
      accent: const HSLColor.fromAHSL(1, 220.0, 0.14, 0.96).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 220.9, 0.39, 0.11).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.84, 0.6).toColor(),
      destructiveForeground: const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 220.0, 0.13, 0.91).toColor(),
      input: const HSLColor.fromAHSL(1, 220.0, 0.13, 0.91).toColor(),
      ring: const HSLColor.fromAHSL(1, 224.0, 0.71, 0.04).toColor(),
      chart1: const HSLColor.fromAHSL(1, 12.0, 0.76, 0.61).toColor(),
      chart2: const HSLColor.fromAHSL(1, 173.0, 0.58, 0.39).toColor(),
      chart3: const HSLColor.fromAHSL(1, 197.0, 0.37, 0.24).toColor(),
      chart4: const HSLColor.fromAHSL(1, 43.0, 0.74, 0.66).toColor(),
      chart5: const HSLColor.fromAHSL(1, 27.0, 0.87, 0.67).toColor(),
    );
  }

  static ColorScheme darkGray() {
    return ColorScheme(
      brightness: Brightness.dark,
      background: const HSLColor.fromAHSL(1, 224.0, 0.71, 0.04).toColor(),
      foreground: const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      card: const HSLColor.fromAHSL(1, 224.0, 0.71, 0.04).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      popover: const HSLColor.fromAHSL(1, 224.0, 0.71, 0.04).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      primary: const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 220.9, 0.39, 0.11).toColor(),
      secondary: const HSLColor.fromAHSL(1, 215.0, 0.28, 0.17).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      muted: const HSLColor.fromAHSL(1, 215.0, 0.28, 0.17).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 217.9, 0.11, 0.65).toColor(),
      accent: const HSLColor.fromAHSL(1, 215.0, 0.28, 0.17).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.63, 0.31).toColor(),
      destructiveForeground: const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 215.0, 0.28, 0.17).toColor(),
      input: const HSLColor.fromAHSL(1, 215.0, 0.28, 0.17).toColor(),
      ring: const HSLColor.fromAHSL(1, 216.0, 0.12, 0.84).toColor(),
      chart1: const HSLColor.fromAHSL(1, 220.0, 0.7, 0.5).toColor(),
      chart2: const HSLColor.fromAHSL(1, 160.0, 0.6, 0.45).toColor(),
      chart3: const HSLColor.fromAHSL(1, 30.0, 0.8, 0.55).toColor(),
      chart4: const HSLColor.fromAHSL(1, 280.0, 0.65, 0.6).toColor(),
      chart5: const HSLColor.fromAHSL(1, 340.0, 0.75, 0.55).toColor(),
    );
  }

  static ColorScheme gray(ThemeMode mode) {
    assert(() {
      _assertNotThemeModeSystem(mode, 'Gray');
      return true;
    }());
    return mode == ThemeMode.light ? lightGray() : darkGray();
  }

  static ColorScheme lightNeutral() {
    return ColorScheme(
      brightness: Brightness.light,
      background: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      foreground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.04).toColor(),
      card: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.04).toColor(),
      popover: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.04).toColor(),
      primary: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.09).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      secondary: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.96).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.09).toColor(),
      muted: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.96).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.45).toColor(),
      accent: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.96).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.09).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.84, 0.6).toColor(),
      destructiveForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.9).toColor(),
      input: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.9).toColor(),
      ring: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.04).toColor(),
      chart1: const HSLColor.fromAHSL(1, 12.0, 0.76, 0.61).toColor(),
      chart2: const HSLColor.fromAHSL(1, 173.0, 0.58, 0.39).toColor(),
      chart3: const HSLColor.fromAHSL(1, 197.0, 0.37, 0.24).toColor(),
      chart4: const HSLColor.fromAHSL(1, 43.0, 0.74, 0.66).toColor(),
      chart5: const HSLColor.fromAHSL(1, 27.0, 0.87, 0.67).toColor(),
    );
  }

  static ColorScheme darkNeutral() {
    return ColorScheme(
      brightness: Brightness.dark,
      background: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.04).toColor(),
      foreground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      card: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.04).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      popover: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.04).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      primary: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.09).toColor(),
      secondary: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.15).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      muted: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.15).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.64).toColor(),
      accent: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.15).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.63, 0.31).toColor(),
      destructiveForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.15).toColor(),
      input: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.15).toColor(),
      ring: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.83).toColor(),
      chart1: const HSLColor.fromAHSL(1, 220.0, 0.7, 0.5).toColor(),
      chart2: const HSLColor.fromAHSL(1, 160.0, 0.6, 0.45).toColor(),
      chart3: const HSLColor.fromAHSL(1, 30.0, 0.8, 0.55).toColor(),
      chart4: const HSLColor.fromAHSL(1, 280.0, 0.65, 0.6).toColor(),
      chart5: const HSLColor.fromAHSL(1, 340.0, 0.75, 0.55).toColor(),
    );
  }

  static ColorScheme neutral(ThemeMode mode) {
    assert(() {
      _assertNotThemeModeSystem(mode, 'Neutral');
      return true;
    }());
    return mode == ThemeMode.light ? lightNeutral() : darkNeutral();
  }

  static ColorScheme lightRed() {
    return ColorScheme(
      brightness: Brightness.light,
      background: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      foreground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.04).toColor(),
      card: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.04).toColor(),
      popover: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.04).toColor(),
      primary: const HSLColor.fromAHSL(1, 0.0, 0.72, 0.51).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 0.0, 0.86, 0.97).toColor(),
      secondary: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.96).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.09).toColor(),
      muted: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.96).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.45).toColor(),
      accent: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.96).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.09).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.84, 0.6).toColor(),
      destructiveForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.9).toColor(),
      input: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.9).toColor(),
      ring: const HSLColor.fromAHSL(1, 0.0, 0.72, 0.51).toColor(),
      chart1: const HSLColor.fromAHSL(1, 12.0, 0.76, 0.61).toColor(),
      chart2: const HSLColor.fromAHSL(1, 173.0, 0.58, 0.39).toColor(),
      chart3: const HSLColor.fromAHSL(1, 197.0, 0.37, 0.24).toColor(),
      chart4: const HSLColor.fromAHSL(1, 43.0, 0.74, 0.66).toColor(),
      chart5: const HSLColor.fromAHSL(1, 27.0, 0.87, 0.67).toColor(),
    );
  }

  static ColorScheme darkRed() {
    return ColorScheme(
      brightness: Brightness.dark,
      background: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.04).toColor(),
      foreground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      card: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.04).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      popover: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.04).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      primary: const HSLColor.fromAHSL(1, 0.0, 0.72, 0.51).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 0.0, 0.86, 0.97).toColor(),
      secondary: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.15).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      muted: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.15).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.64).toColor(),
      accent: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.15).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.63, 0.31).toColor(),
      destructiveForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.15).toColor(),
      input: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.15).toColor(),
      ring: const HSLColor.fromAHSL(1, 0.0, 0.72, 0.51).toColor(),
      chart1: const HSLColor.fromAHSL(1, 220.0, 0.7, 0.5).toColor(),
      chart2: const HSLColor.fromAHSL(1, 160.0, 0.6, 0.45).toColor(),
      chart3: const HSLColor.fromAHSL(1, 30.0, 0.8, 0.55).toColor(),
      chart4: const HSLColor.fromAHSL(1, 280.0, 0.65, 0.6).toColor(),
      chart5: const HSLColor.fromAHSL(1, 340.0, 0.75, 0.55).toColor(),
    );
  }

  static ColorScheme red(ThemeMode mode) {
    assert(() {
      _assertNotThemeModeSystem(mode, 'Red');
      return true;
    }());
    return mode == ThemeMode.light ? lightRed() : darkRed();
  }

  static ColorScheme lightRose() {
    return ColorScheme(
      brightness: Brightness.light,
      background: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      foreground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      card: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      popover: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      primary: const HSLColor.fromAHSL(1, 346.8, 0.77, 0.5).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 355.7, 1.0, 0.97).toColor(),
      secondary: const HSLColor.fromAHSL(1, 240.0, 0.05, 0.96).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      muted: const HSLColor.fromAHSL(1, 240.0, 0.05, 0.96).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 240.0, 0.04, 0.46).toColor(),
      accent: const HSLColor.fromAHSL(1, 240.0, 0.05, 0.96).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.84, 0.6).toColor(),
      destructiveForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      input: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      ring: const HSLColor.fromAHSL(1, 346.8, 0.77, 0.5).toColor(),
      chart1: const HSLColor.fromAHSL(1, 12.0, 0.76, 0.61).toColor(),
      chart2: const HSLColor.fromAHSL(1, 173.0, 0.58, 0.39).toColor(),
      chart3: const HSLColor.fromAHSL(1, 197.0, 0.37, 0.24).toColor(),
      chart4: const HSLColor.fromAHSL(1, 43.0, 0.74, 0.66).toColor(),
      chart5: const HSLColor.fromAHSL(1, 27.0, 0.87, 0.67).toColor(),
    );
  }

  static ColorScheme darkRose() {
    return ColorScheme(
      brightness: Brightness.dark,
      background: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      foreground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.95).toColor(),
      popover: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.09).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.95).toColor(),
      card: const HSLColor.fromAHSL(1, 24.0, 0.1, 0.1).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.95).toColor(),
      primary: const HSLColor.fromAHSL(1, 346.8, 0.77, 0.5).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 355.7, 1.0, 0.97).toColor(),
      secondary: const HSLColor.fromAHSL(1, 240.0, 0.04, 0.16).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      muted: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.15).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 240.0, 0.05, 0.65).toColor(),
      accent: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.63, 0.31).toColor(),
      destructiveForeground: const HSLColor.fromAHSL(1, 0.0, 0.86, 0.97).toColor(),
      border: const HSLColor.fromAHSL(1, 240.0, 0.04, 0.16).toColor(),
      input: const HSLColor.fromAHSL(1, 240.0, 0.04, 0.16).toColor(),
      ring: const HSLColor.fromAHSL(1, 346.8, 0.77, 0.5).toColor(),
      chart1: const HSLColor.fromAHSL(1, 220.0, 0.7, 0.5).toColor(),
      chart2: const HSLColor.fromAHSL(1, 160.0, 0.6, 0.45).toColor(),
      chart3: const HSLColor.fromAHSL(1, 30.0, 0.8, 0.55).toColor(),
      chart4: const HSLColor.fromAHSL(1, 280.0, 0.65, 0.6).toColor(),
      chart5: const HSLColor.fromAHSL(1, 340.0, 0.75, 0.55).toColor(),
    );
  }

  static ColorScheme rose(ThemeMode mode) {
    assert(() {
      _assertNotThemeModeSystem(mode, 'Rose');
      return true;
    }());
    return mode == ThemeMode.light ? lightRose() : darkRose();
  }

  static ColorScheme lightOrange() {
    return ColorScheme(
      brightness: Brightness.light,
      background: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      foreground: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      card: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      popover: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      primary: const HSLColor.fromAHSL(1, 24.6, 0.95, 0.53).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      secondary: const HSLColor.fromAHSL(1, 60.0, 0.05, 0.96).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 24.0, 0.1, 0.1).toColor(),
      muted: const HSLColor.fromAHSL(1, 60.0, 0.05, 0.96).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 25.0, 0.05, 0.45).toColor(),
      accent: const HSLColor.fromAHSL(1, 60.0, 0.05, 0.96).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 24.0, 0.1, 0.1).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.84, 0.6).toColor(),
      destructiveForeground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 20.0, 0.06, 0.9).toColor(),
      input: const HSLColor.fromAHSL(1, 20.0, 0.06, 0.9).toColor(),
      ring: const HSLColor.fromAHSL(1, 24.6, 0.95, 0.53).toColor(),
      chart1: const HSLColor.fromAHSL(1, 12.0, 0.76, 0.61).toColor(),
      chart2: const HSLColor.fromAHSL(1, 173.0, 0.58, 0.39).toColor(),
      chart3: const HSLColor.fromAHSL(1, 197.0, 0.37, 0.24).toColor(),
      chart4: const HSLColor.fromAHSL(1, 43.0, 0.74, 0.66).toColor(),
      chart5: const HSLColor.fromAHSL(1, 27.0, 0.87, 0.67).toColor(),
    );
  }

  static ColorScheme darkOrange() {
    return ColorScheme(
      brightness: Brightness.dark,
      background: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      foreground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      card: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      popover: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      primary: const HSLColor.fromAHSL(1, 20.5, 0.9, 0.48).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      secondary: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      muted: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 24.0, 0.05, 0.64).toColor(),
      accent: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.72, 0.51).toColor(),
      destructiveForeground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      input: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      ring: const HSLColor.fromAHSL(1, 20.5, 0.9, 0.48).toColor(),
      chart1: const HSLColor.fromAHSL(1, 220.0, 0.7, 0.5).toColor(),
      chart2: const HSLColor.fromAHSL(1, 160.0, 0.6, 0.45).toColor(),
      chart3: const HSLColor.fromAHSL(1, 30.0, 0.8, 0.55).toColor(),
      chart4: const HSLColor.fromAHSL(1, 280.0, 0.65, 0.6).toColor(),
      chart5: const HSLColor.fromAHSL(1, 340.0, 0.75, 0.55).toColor(),
    );
  }

  static ColorScheme orange(ThemeMode mode) {
    assert(() {
      _assertNotThemeModeSystem(mode, 'Orange');
      return true;
    }());
    return mode == ThemeMode.light ? lightOrange() : darkOrange();
  }

  static ColorScheme lightGreen() {
    return ColorScheme(
      brightness: Brightness.light,
      background: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      foreground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      card: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      popover: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 240.0, 0.1, 0.04).toColor(),
      primary: const HSLColor.fromAHSL(1, 142.1, 0.76, 0.36).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 355.7, 1.0, 0.97).toColor(),
      secondary: const HSLColor.fromAHSL(1, 240.0, 0.05, 0.96).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      muted: const HSLColor.fromAHSL(1, 240.0, 0.05, 0.96).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 240.0, 0.04, 0.46).toColor(),
      accent: const HSLColor.fromAHSL(1, 240.0, 0.05, 0.96).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.1).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.84, 0.6).toColor(),
      destructiveForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      input: const HSLColor.fromAHSL(1, 240.0, 0.06, 0.9).toColor(),
      ring: const HSLColor.fromAHSL(1, 142.1, 0.76, 0.36).toColor(),
      chart1: const HSLColor.fromAHSL(1, 12.0, 0.76, 0.61).toColor(),
      chart2: const HSLColor.fromAHSL(1, 173.0, 0.58, 0.39).toColor(),
      chart3: const HSLColor.fromAHSL(1, 197.0, 0.37, 0.24).toColor(),
      chart4: const HSLColor.fromAHSL(1, 43.0, 0.74, 0.66).toColor(),
      chart5: const HSLColor.fromAHSL(1, 27.0, 0.87, 0.67).toColor(),
    );
  }

  static ColorScheme darkGreen() {
    return ColorScheme(
      brightness: Brightness.dark,
      background: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      foreground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.95).toColor(),
      popover: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.09).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.95).toColor(),
      card: const HSLColor.fromAHSL(1, 24.0, 0.1, 0.1).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.95).toColor(),
      primary: const HSLColor.fromAHSL(1, 142.1, 0.71, 0.45).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 144.9, 0.8, 0.1).toColor(),
      secondary: const HSLColor.fromAHSL(1, 240.0, 0.04, 0.16).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      muted: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.15).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 240.0, 0.05, 0.65).toColor(),
      accent: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 0.0, 0.0, 0.98).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.63, 0.31).toColor(),
      destructiveForeground: const HSLColor.fromAHSL(1, 0.0, 0.86, 0.97).toColor(),
      border: const HSLColor.fromAHSL(1, 240.0, 0.04, 0.16).toColor(),
      input: const HSLColor.fromAHSL(1, 240.0, 0.04, 0.16).toColor(),
      ring: const HSLColor.fromAHSL(1, 142.4, 0.72, 0.29).toColor(),
      chart1: const HSLColor.fromAHSL(1, 220.0, 0.7, 0.5).toColor(),
      chart2: const HSLColor.fromAHSL(1, 160.0, 0.6, 0.45).toColor(),
      chart3: const HSLColor.fromAHSL(1, 30.0, 0.8, 0.55).toColor(),
      chart4: const HSLColor.fromAHSL(1, 280.0, 0.65, 0.6).toColor(),
      chart5: const HSLColor.fromAHSL(1, 340.0, 0.75, 0.55).toColor(),
    );
  }

  static ColorScheme green(ThemeMode mode) {
    assert(() {
      _assertNotThemeModeSystem(mode, 'Green');
      return true;
    }());
    return mode == ThemeMode.light ? lightGreen() : darkGreen();
  }

  static ColorScheme lightBlue() {
    return ColorScheme(
      brightness: Brightness.light,
      background: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      foreground: const HSLColor.fromAHSL(1, 222.2, 0.84, 0.05).toColor(),
      card: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 222.2, 0.84, 0.05).toColor(),
      popover: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 222.2, 0.84, 0.05).toColor(),
      primary: const HSLColor.fromAHSL(1, 221.2, 0.83, 0.53).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      secondary: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.96).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 222.2, 0.47, 0.11).toColor(),
      muted: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.96).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 215.4, 0.16, 0.47).toColor(),
      accent: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.96).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 222.2, 0.47, 0.11).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.84, 0.6).toColor(),
      destructiveForeground: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 214.3, 0.32, 0.91).toColor(),
      input: const HSLColor.fromAHSL(1, 214.3, 0.32, 0.91).toColor(),
      ring: const HSLColor.fromAHSL(1, 221.2, 0.83, 0.53).toColor(),
      chart1: const HSLColor.fromAHSL(1, 12.0, 0.76, 0.61).toColor(),
      chart2: const HSLColor.fromAHSL(1, 173.0, 0.58, 0.39).toColor(),
      chart3: const HSLColor.fromAHSL(1, 197.0, 0.37, 0.24).toColor(),
      chart4: const HSLColor.fromAHSL(1, 43.0, 0.74, 0.66).toColor(),
      chart5: const HSLColor.fromAHSL(1, 27.0, 0.87, 0.67).toColor(),
    );
  }

  static ColorScheme darkBlue() {
    return ColorScheme(
      brightness: Brightness.dark,
      background: const HSLColor.fromAHSL(1, 222.2, 0.84, 0.05).toColor(),
      foreground: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      card: const HSLColor.fromAHSL(1, 222.2, 0.84, 0.05).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      popover: const HSLColor.fromAHSL(1, 222.2, 0.84, 0.05).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      primary: const HSLColor.fromAHSL(1, 217.2, 0.91, 0.6).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 222.2, 0.47, 0.11).toColor(),
      secondary: const HSLColor.fromAHSL(1, 217.2, 0.33, 0.18).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      muted: const HSLColor.fromAHSL(1, 217.2, 0.33, 0.18).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 215.0, 0.2, 0.65).toColor(),
      accent: const HSLColor.fromAHSL(1, 217.2, 0.33, 0.18).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.63, 0.31).toColor(),
      destructiveForeground: const HSLColor.fromAHSL(1, 210.0, 0.4, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 217.2, 0.33, 0.18).toColor(),
      input: const HSLColor.fromAHSL(1, 217.2, 0.33, 0.18).toColor(),
      ring: const HSLColor.fromAHSL(1, 224.3, 0.76, 0.48).toColor(),
      chart1: const HSLColor.fromAHSL(1, 220.0, 0.7, 0.5).toColor(),
      chart2: const HSLColor.fromAHSL(1, 160.0, 0.6, 0.45).toColor(),
      chart3: const HSLColor.fromAHSL(1, 30.0, 0.8, 0.55).toColor(),
      chart4: const HSLColor.fromAHSL(1, 280.0, 0.65, 0.6).toColor(),
      chart5: const HSLColor.fromAHSL(1, 340.0, 0.75, 0.55).toColor(),
    );
  }

  static ColorScheme blue(ThemeMode mode) {
    assert(() {
      _assertNotThemeModeSystem(mode, 'Blue');
      return true;
    }());
    return mode == ThemeMode.light ? lightBlue() : darkBlue();
  }

  static ColorScheme lightYellow() {
    return ColorScheme(
      brightness: Brightness.light,
      background: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      foreground: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      card: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      popover: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      primary: const HSLColor.fromAHSL(1, 47.9, 0.96, 0.53).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 26.0, 0.83, 0.14).toColor(),
      secondary: const HSLColor.fromAHSL(1, 60.0, 0.05, 0.96).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 24.0, 0.1, 0.1).toColor(),
      muted: const HSLColor.fromAHSL(1, 60.0, 0.05, 0.96).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 25.0, 0.05, 0.45).toColor(),
      accent: const HSLColor.fromAHSL(1, 60.0, 0.05, 0.96).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 24.0, 0.1, 0.1).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.84, 0.6).toColor(),
      destructiveForeground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 20.0, 0.06, 0.9).toColor(),
      input: const HSLColor.fromAHSL(1, 20.0, 0.06, 0.9).toColor(),
      ring: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      chart1: const HSLColor.fromAHSL(1, 12.0, 0.76, 0.61).toColor(),
      chart2: const HSLColor.fromAHSL(1, 173.0, 0.58, 0.39).toColor(),
      chart3: const HSLColor.fromAHSL(1, 197.0, 0.37, 0.24).toColor(),
      chart4: const HSLColor.fromAHSL(1, 43.0, 0.74, 0.66).toColor(),
      chart5: const HSLColor.fromAHSL(1, 27.0, 0.87, 0.67).toColor(),
    );
  }

  static ColorScheme darkYellow() {
    return ColorScheme(
      brightness: Brightness.dark,
      background: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      foreground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      card: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      popover: const HSLColor.fromAHSL(1, 20.0, 0.14, 0.04).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      primary: const HSLColor.fromAHSL(1, 47.9, 0.96, 0.53).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 26.0, 0.83, 0.14).toColor(),
      secondary: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      muted: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 24.0, 0.05, 0.64).toColor(),
      accent: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.63, 0.31).toColor(),
      destructiveForeground: const HSLColor.fromAHSL(1, 60.0, 0.09, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      input: const HSLColor.fromAHSL(1, 12.0, 0.07, 0.15).toColor(),
      ring: const HSLColor.fromAHSL(1, 35.5, 0.92, 0.33).toColor(),
      chart1: const HSLColor.fromAHSL(1, 220.0, 0.7, 0.5).toColor(),
      chart2: const HSLColor.fromAHSL(1, 160.0, 0.6, 0.45).toColor(),
      chart3: const HSLColor.fromAHSL(1, 30.0, 0.8, 0.55).toColor(),
      chart4: const HSLColor.fromAHSL(1, 280.0, 0.65, 0.6).toColor(),
      chart5: const HSLColor.fromAHSL(1, 340.0, 0.75, 0.55).toColor(),
    );
  }

  static ColorScheme yellow(ThemeMode mode) {
    assert(() {
      _assertNotThemeModeSystem(mode, 'Yellow');
      return true;
    }());
    return mode == ThemeMode.light ? lightYellow() : darkYellow();
  }

  static ColorScheme lightViolet() {
    return ColorScheme(
      brightness: Brightness.light,
      background: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      foreground: const HSLColor.fromAHSL(1, 224.0, 0.71, 0.04).toColor(),
      card: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 224.0, 0.71, 0.04).toColor(),
      popover: const HSLColor.fromAHSL(1, 0.0, 0.0, 1.0).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 224.0, 0.71, 0.04).toColor(),
      primary: const HSLColor.fromAHSL(1, 262.1, 0.83, 0.58).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      secondary: const HSLColor.fromAHSL(1, 220.0, 0.14, 0.96).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 220.9, 0.39, 0.11).toColor(),
      muted: const HSLColor.fromAHSL(1, 220.0, 0.14, 0.96).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 220.0, 0.09, 0.46).toColor(),
      accent: const HSLColor.fromAHSL(1, 220.0, 0.14, 0.96).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 220.9, 0.39, 0.11).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.84, 0.6).toColor(),
      destructiveForeground: const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 220.0, 0.13, 0.91).toColor(),
      input: const HSLColor.fromAHSL(1, 220.0, 0.13, 0.91).toColor(),
      ring: const HSLColor.fromAHSL(1, 262.1, 0.83, 0.58).toColor(),
      chart1: const HSLColor.fromAHSL(1, 12.0, 0.76, 0.61).toColor(),
      chart2: const HSLColor.fromAHSL(1, 173.0, 0.58, 0.39).toColor(),
      chart3: const HSLColor.fromAHSL(1, 197.0, 0.37, 0.24).toColor(),
      chart4: const HSLColor.fromAHSL(1, 43.0, 0.74, 0.66).toColor(),
      chart5: const HSLColor.fromAHSL(1, 27.0, 0.87, 0.67).toColor(),
    );
  }

  static ColorScheme darkViolet() {
    return ColorScheme(
      brightness: Brightness.dark,
      background: const HSLColor.fromAHSL(1, 224.0, 0.71, 0.04).toColor(),
      foreground: const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      card: const HSLColor.fromAHSL(1, 224.0, 0.71, 0.04).toColor(),
      cardForeground: const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      popover: const HSLColor.fromAHSL(1, 224.0, 0.71, 0.04).toColor(),
      popoverForeground: const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      primary: const HSLColor.fromAHSL(1, 263.4, 0.7, 0.5).toColor(),
      primaryForeground: const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      secondary: const HSLColor.fromAHSL(1, 215.0, 0.28, 0.17).toColor(),
      secondaryForeground: const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      muted: const HSLColor.fromAHSL(1, 215.0, 0.28, 0.17).toColor(),
      mutedForeground: const HSLColor.fromAHSL(1, 217.9, 0.11, 0.65).toColor(),
      accent: const HSLColor.fromAHSL(1, 215.0, 0.28, 0.17).toColor(),
      accentForeground: const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      destructive: const HSLColor.fromAHSL(1, 0.0, 0.63, 0.31).toColor(),
      destructiveForeground: const HSLColor.fromAHSL(1, 210.0, 0.2, 0.98).toColor(),
      border: const HSLColor.fromAHSL(1, 215.0, 0.28, 0.17).toColor(),
      input: const HSLColor.fromAHSL(1, 215.0, 0.28, 0.17).toColor(),
      ring: const HSLColor.fromAHSL(1, 263.4, 0.7, 0.5).toColor(),
      chart1: const HSLColor.fromAHSL(1, 220.0, 0.7, 0.5).toColor(),
      chart2: const HSLColor.fromAHSL(1, 160.0, 0.6, 0.45).toColor(),
      chart3: const HSLColor.fromAHSL(1, 30.0, 0.8, 0.55).toColor(),
      chart4: const HSLColor.fromAHSL(1, 280.0, 0.65, 0.6).toColor(),
      chart5: const HSLColor.fromAHSL(1, 340.0, 0.75, 0.55).toColor(),
    );
  }

  static ColorScheme violet(ThemeMode mode) {
    assert(() {
      _assertNotThemeModeSystem(mode, 'Violet');
      return true;
    }());
    return mode == ThemeMode.light ? lightViolet() : darkViolet();
  }
}

void _assertNotThemeModeSystem(ThemeMode mode, String label) {
  if (mode == ThemeMode.system) {
    final List<DiagnosticsNode> diagnosticList = [];
    diagnosticList.add(ErrorSummary(
        'ColorSchemes.${label.toLowerCase()}(ThemeMode mode) can only be used with ThemeMode.light or ThemeMode.dark.'));
    diagnosticList.add(ErrorDescription(
        'This method is only intended as a helper method to get either ColorSchemes.light$label() or ColorSchemes.dark$label().'));
    diagnosticList.add(ErrorHint('To use system theme mode, do this:\n'
        'ShadcnApp(\n'
        '  theme: ThemeData(colorScheme: ColorSchemes.${label.toLowerCase()}(ThemeMode.light)),\n'
        '  darkTheme: ThemeData(colorScheme: ColorSchemes.${label.toLowerCase()}(ThemeMode.dark)),\n'
        '  themeMode: ThemeMode.system, // optional, default is ThemeMode.system\n'
        ')\n'
        'or:\n'
        'ShadcnApp(\n'
        '  theme: ThemeData(colorScheme: ColorSchemes.light$label()),\n'
        '  darkTheme: ThemeData(colorScheme: ColorScheme.dark$label()),\n'
        ')\n'
        'instead of:\n'
        'ShadcnApp(\n'
        '  theme: ThemeData(colorScheme: ColorSchemes.${label.toLowerCase()}(ThemeMode.system)),\n'
        ')'));
    throw FlutterError.fromParts(diagnosticList);
  }
}
