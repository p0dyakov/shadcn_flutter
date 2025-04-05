import 'dart:ui' hide Radius;

import 'package:flutter/foundation.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:shadcn_flutter/src/theme/icon_theme.dart';

class ThemeData {
  final ColorScheme colorScheme;
  final Typography typography;
  final Radiuses radiuses;
  final double scaling;
  final Icons icons;
  final double? surfaceOpacity;
  final double? surfaceBlur;
  final TargetPlatform? _platform;

  ThemeData({
    required this.colorScheme,
    this.scaling = 1,
    Radiuses? radiuses,
    Typography? typography,
    Icons? icons,
    TargetPlatform? platform,
    this.surfaceOpacity,
    this.surfaceBlur,
  })  : _platform = platform,
        radiuses = radiuses ?? Radiuses(scaling: scaling),
        icons = icons ?? Icons(scaling: scaling),
        typography = typography ?? Typography.geist(scaling: scaling);

  TargetPlatform get platform => _platform ?? defaultTargetPlatform;

  Brightness get brightness => colorScheme.brightness;

  ThemeData copyWith({
    ColorScheme? colorScheme,
    Radiuses? radiuses,
    Typography? typography,
    TargetPlatform? platform,
    double? scaling,
    Icons? icons,
    double? surfaceOpacity,
    double? surfaceBlur,
  }) {
    return ThemeData(
      colorScheme: colorScheme ?? this.colorScheme,
      radiuses: radiuses ?? this.radiuses,
      typography: typography ?? this.typography,
      platform: platform ?? _platform,
      scaling: scaling ?? this.scaling,
      icons: icons ?? this.icons,
      surfaceOpacity: surfaceOpacity ?? this.surfaceOpacity,
      surfaceBlur: surfaceBlur ?? this.surfaceBlur,
    );
  }

  static ThemeData lerp(
    ThemeData a,
    ThemeData b,
    double t,
  ) {
    return ThemeData(
      colorScheme: ColorScheme.lerp(a.colorScheme, b.colorScheme, t),
      radiuses: Radiuses.lerp(a.radiuses, b.radiuses, t),
      typography: Typography.lerp(a.typography, b.typography, t),
      platform: t < 0.5 ? a.platform : b.platform,
      scaling: lerpDouble(a.scaling, b.scaling, t)!,
      icons: Icons.lerp(a.icons, b.icons, t),
      surfaceOpacity: lerpDouble(a.surfaceOpacity, b.surfaceOpacity, t),
      surfaceBlur: lerpDouble(a.surfaceBlur, b.surfaceBlur, t),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ThemeData &&
        other.colorScheme == colorScheme &&
        other.typography == typography &&
        other.radiuses == radiuses &&
        other.scaling == scaling &&
        other.icons == icons &&
        other.surfaceOpacity == surfaceOpacity &&
        other.surfaceBlur == surfaceBlur;
  }

  @override
  int get hashCode {
    return Object.hash(
      colorScheme,
      typography,
      radiuses,
      scaling,
      icons,
      surfaceOpacity,
      surfaceBlur,
    );
  }

  @override
  String toString() {
    return 'ThemeData(colorScheme: $colorScheme, typography: $typography, radiuses: $radiuses, scaling: $scaling, icons: $icons, surfaceOpacity: $surfaceOpacity, surfaceBlur: $surfaceBlur)';
  }
}

class Theme extends InheritedTheme {
  final ThemeData data;

  const Theme({
    super.key,
    required this.data,
    required super.child,
  });

  static ThemeData of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<Theme>();
    assert(theme != null, 'No Theme found in context');
    return theme!.data;
  }

  @override
  bool updateShouldNotify(covariant Theme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    final Theme? ancestorTheme = context.findAncestorWidgetOfExactType<Theme>();
    return identical(this, ancestorTheme) ? child : Theme(data: data, child: child);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ThemeData>('data', data));
  }
}

class ThemeDataTween extends Tween<ThemeData> {
  ThemeDataTween({required ThemeData super.begin, required super.end});

  @override
  ThemeData lerp(double t) {
    if (end == null) {
      return begin!;
    }
    return ThemeData.lerp(begin!, end!, t);
  }
}

class AnimatedTheme extends ImplicitlyAnimatedWidget {
  final ThemeData data;
  final Widget child;

  const AnimatedTheme({
    super.key,
    required this.data,
    required super.duration,
    super.curve,
    required this.child,
  });

  @override
  AnimatedWidgetBaseState<AnimatedTheme> createState() => _AnimatedThemeState();
}

class _AnimatedThemeState extends AnimatedWidgetBaseState<AnimatedTheme> {
  ThemeDataTween? _data;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _data = visitor(
      _data,
      widget.data,
      (dynamic value) => ThemeDataTween(begin: value as ThemeData, end: null),
    ) as ThemeDataTween?;
  }

  @override
  Widget build(BuildContext context) {
    final theme = _data!.evaluate(animation);
    return Theme(data: theme, child: widget.child);
  }
}

class ComponentTheme<T> extends InheritedTheme {
  final T data;

  const ComponentTheme({
    super.key,
    required this.data,
    required super.child,
  });

  @override
  Widget wrap(BuildContext context, Widget child) {
    ComponentTheme<T>? ancestorTheme = context.findAncestorWidgetOfExactType<ComponentTheme<T>>();
    if (identical(this, ancestorTheme)) {
      return child;
    }
    return ComponentTheme<T>(
      data: data,
      child: child,
    );
  }

  static T of<T>(BuildContext context) {
    final data = maybeOf<T>(context);
    assert(data != null, 'No ComponentTheme<$T> found in context');
    return data!;
  }

  static T? maybeOf<T>(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<ComponentTheme<T>>();
    if (widget == null) {
      return null;
    }
    return widget.data;
  }

  @override
  bool updateShouldNotify(covariant ComponentTheme<T> oldWidget) {
    return oldWidget.data != data;
  }
}

enum ThemeMode {
  system,
  light,
  dark,
}
