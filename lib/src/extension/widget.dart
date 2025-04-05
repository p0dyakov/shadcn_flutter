import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';

extension WidgetExtension on Widget {
  NeverWidgetBuilder get asBuilder => ([a, b, c, d, e, f, g, h, i, j]) => this;
  Widget withSized({double? width, double? height}) {
    if (this is SizedBox) {
      return SizedBox(
        width: width ?? (this as SizedBox).width,
        height: height ?? (this as SizedBox).height,
        child: (this as SizedBox).child,
      );
    }
    return SizedBox(
      width: width,
      height: height,
      child: this,
    );
  }

  Widget withConstrained(
      {double? minWidth, double? maxWidth, double? minHeight, double? maxHeight, double? width, double? height}) {
    if (this is ConstrainedBox) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: width ?? minWidth ?? (this as ConstrainedBox).constraints.minWidth,
          maxWidth: width ?? maxWidth ?? (this as ConstrainedBox).constraints.maxWidth,
          minHeight: height ?? minHeight ?? (this as ConstrainedBox).constraints.minHeight,
          maxHeight: height ?? maxHeight ?? (this as ConstrainedBox).constraints.maxHeight,
        ),
        child: (this as ConstrainedBox).child,
      );
    }
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: width ?? minWidth ?? 0,
        maxWidth: width ?? maxWidth ?? double.infinity,
        minHeight: height ?? minHeight ?? 0,
        maxHeight: height ?? maxHeight ?? double.infinity,
      ),
      child: this,
    );
  }

  Widget withPadding(
      {double? top,
      double? bottom,
      double? left,
      double? right,
      double? horizontal,
      double? vertical,
      double? all,
      EdgeInsetsGeometry? padding}) {
    assert(() {
      if (all != null) {
        if (top != null || bottom != null || left != null || right != null || horizontal != null || vertical != null) {
          throw FlutterError('All padding properties cannot be used with other padding properties.');
        }
      } else if (horizontal != null) {
        if (left != null || right != null) {
          throw FlutterError('Horizontal padding cannot be used with left or right padding.');
        }
      } else if (vertical != null) {
        if (top != null || bottom != null) {
          throw FlutterError('Vertical padding cannot be used with top or bottom padding.');
        }
      }
      return true;
    }());
    var edgeInsets = EdgeInsets.only(
      top: top ?? vertical ?? all ?? 0,
      bottom: bottom ?? vertical ?? all ?? 0,
      left: left ?? horizontal ?? all ?? 0,
      right: right ?? horizontal ?? all ?? 0,
    );
    return Padding(
      padding: padding ?? edgeInsets,
      child: this,
    );
  }

  Widget withMargin(
      {double? top, double? bottom, double? left, double? right, double? horizontal, double? vertical, double? all}) {
    assert(() {
      if (all != null) {
        if (top != null || bottom != null || left != null || right != null || horizontal != null || vertical != null) {
          throw FlutterError('All margin properties cannot be used with other margin properties.');
        }
      } else if (horizontal != null) {
        if (left != null || right != null) {
          throw FlutterError('Horizontal margin cannot be used with left or right margin.');
        }
      } else if (vertical != null) {
        if (top != null || bottom != null) {
          throw FlutterError('Vertical margin cannot be used with top or bottom margin.');
        }
      }
      return true;
    }());
    return Container(
      margin: EdgeInsets.only(
        top: top ?? vertical ?? all ?? 0,
        bottom: bottom ?? vertical ?? all ?? 0,
        left: left ?? horizontal ?? all ?? 0,
        right: right ?? horizontal ?? all ?? 0,
      ),
      child: this,
    );
  }

  Widget withCenter({Key? key}) {
    return Center(
      key: key,
      child: this,
    );
  }

  Widget withAlign(AlignmentGeometry alignment) {
    return Align(
      alignment: alignment,
      child: this,
    );
  }

  Widget withPositioned({Key? key, double? left, double? top, double? right, double? bottom}) {
    return Positioned(
      key: key,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      child: this,
    );
  }

  Widget withExpanded({int flex = 1}) {
    return Expanded(
      flex: flex,
      child: this,
    );
  }

  Widget withOpacity(double opacity) {
    return Opacity(
      opacity: opacity,
      child: this,
    );
  }

  Widget withClip({Clip clipBehavior = Clip.hardEdge}) {
    return ClipRect(
      clipBehavior: clipBehavior,
      child: this,
    );
  }

  Widget withClipRRect({BorderRadiusGeometry borderRadius = BorderRadius.zero, Clip clipBehavior = Clip.antiAlias}) {
    return ClipRRect(
      borderRadius: borderRadius,
      clipBehavior: clipBehavior,
      child: this,
    );
  }

  Widget withClipOval({Clip clipBehavior = Clip.antiAlias}) {
    return ClipOval(
      clipBehavior: clipBehavior,
      child: this,
    );
  }

  Widget withClipPath({Clip clipBehavior = Clip.antiAlias, required CustomClipper<Path> clipper}) {
    return ClipPath(
      clipBehavior: clipBehavior,
      clipper: clipper,
      child: this,
    );
  }

  Widget withTransform({Key? key, required Matrix4 transform}) {
    return Transform(
      key: key,
      transform: transform,
      child: this,
    );
  }

  Widget withIntrinsicWidth({double? stepWidth, double? stepHeight}) {
    return IntrinsicWidth(
      stepWidth: stepWidth,
      stepHeight: stepHeight,
      child: this,
    );
  }

  Widget withIntrinsicHeight() {
    return IntrinsicHeight(
      child: this,
    );
  }

  Widget withIntrinsic({double? stepWidth, double? stepHeight}) {
    return IntrinsicWidth(
      stepWidth: stepWidth,
      stepHeight: stepHeight,
      child: IntrinsicHeight(
        child: this,
      ),
    );
  }
}

extension TextExtension on Widget {
  Widget text1() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWithStyle(
        (context, theme) => theme.typography.s1,
      );
    }
    return WrappedText(style: (context, theme) => theme.typography.s1, child: this);
  }

  Widget text2() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWithStyle(
        (context, theme) => theme.typography.s2,
      );
    }
    return WrappedText(style: (context, theme) => theme.typography.s2, child: this);
  }

  Widget text3() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWithStyle(
        (context, theme) => theme.typography.s3,
      );
    }
    return WrappedText(style: (context, theme) => theme.typography.s3, child: this);
  }

  Widget text4() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWithStyle(
        (context, theme) => theme.typography.s4,
      );
    }
    return WrappedText(style: (context, theme) => theme.typography.s4, child: this);
  }

  Widget text5() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWithStyle(
        (context, theme) => theme.typography.s5,
      );
    }
    return WrappedText(style: (context, theme) => theme.typography.s5, child: this);
  }

  Widget text6() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWithStyle(
        (context, theme) => theme.typography.s6,
      );
    }
    return WrappedText(style: (context, theme) => theme.typography.s6, child: this);
  }

  Widget text7() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWithStyle(
        (context, theme) => theme.typography.s7,
      );
    }
    return WrappedText(style: (context, theme) => theme.typography.s7, child: this);
  }

  Widget text8() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWithStyle(
        (context, theme) => theme.typography.s8,
      );
    }
    return WrappedText(style: (context, theme) => theme.typography.s8, child: this);
  }

  Widget text9() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWithStyle(
        (context, theme) => theme.typography.s9,
      );
    }
    return WrappedText(style: (context, theme) => theme.typography.s9, child: this);
  }

  Widget text10() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWithStyle(
        (context, theme) => theme.typography.s10,
      );
    }
    return WrappedText(style: (context, theme) => theme.typography.s10, child: this);
  }

  Widget text11() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWithStyle(
        (context, theme) => theme.typography.s11,
      );
    }
    return WrappedText(style: (context, theme) => theme.typography.s11, child: this);
  }

  Widget text12() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWithStyle(
        (context, theme) => theme.typography.s12,
      );
    }
    return WrappedText(style: (context, theme) => theme.typography.s12, child: this);
  }

  Widget text13() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWithStyle(
        (context, theme) => theme.typography.s13,
      );
    }
    return WrappedText(style: (context, theme) => theme.typography.s13, child: this);
  }

  Widget textW1() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWithStyle(
        (context, theme) => theme.typography.w1,
      );
    }
    return WrappedText(style: (context, theme) => theme.typography.w1, child: this);
  }

  Widget textW2() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWithStyle(
        (context, theme) => theme.typography.w2,
      );
    }
    return WrappedText(style: (context, theme) => theme.typography.w2, child: this);
  }

  Widget textW3() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWithStyle(
        (context, theme) => theme.typography.w3,
      );
    }
    return WrappedText(style: (context, theme) => theme.typography.w3, child: this);
  }

  Widget textW4() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWithStyle(
        (context, theme) => theme.typography.w4,
      );
    }
    return WrappedText(style: (context, theme) => theme.typography.w4, child: this);
  }

  Widget textW5() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWithStyle(
        (context, theme) => theme.typography.w5,
      );
    }
    return WrappedText(style: (context, theme) => theme.typography.w5, child: this);
  }

  Widget textW6() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWithStyle(
        (context, theme) => theme.typography.w6,
      );
    }
    return WrappedText(style: (context, theme) => theme.typography.w6, child: this);
  }

  Widget textW7() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWithStyle(
        (context, theme) => theme.typography.w7,
      );
    }
    return WrappedText(style: (context, theme) => theme.typography.w7, child: this);
  }

  Widget textW8() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWithStyle(
        (context, theme) => theme.typography.w8,
      );
    }
    return WrappedText(style: (context, theme) => theme.typography.w8, child: this);
  }

  Widget textW9() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWithStyle(
        (context, theme) => theme.typography.w9,
      );
    }
    return WrappedText(style: (context, theme) => theme.typography.w9, child: this);
  }

  Widget textSans() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWithStyle(
        (context, theme) => theme.typography.sans,
      );
    }
    return WrappedText(style: (context, theme) => theme.typography.sans, child: this);
  }

  Widget textMono() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWithStyle(
        (context, theme) => theme.typography.mono,
      );
    }
    return WrappedText(style: (context, theme) => theme.typography.mono, child: this);
  }

  Widget textItalic() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWithStyle(
        (context, theme) => theme.typography.italic,
      );
    }
    return WrappedText(style: (context, theme) => theme.typography.italic, child: this);
  }

  Widget textUnderline() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWithStyle(
        (context, theme) => const TextStyle(
          decoration: TextDecoration.underline,
        ),
      );
    }
    return WrappedText(
        style: (context, theme) => const TextStyle(
              decoration: TextDecoration.underline,
            ),
        child: this);
  }

  Widget textMuted() {
    return Builder(
      builder: (context) {
        final themeData = Theme.of(context);
        return DefaultTextStyle.merge(
          child: this,
          style: TextStyle(
            color: themeData.colorScheme.mutedForeground,
          ),
        );
      },
    );
  }

  Widget textPrimaryForeground() {
    return Builder(
      builder: (context) {
        final themeData = Theme.of(context);
        return DefaultTextStyle.merge(
          child: this,
          style: TextStyle(
            color: themeData.colorScheme.primaryForeground,
          ),
        );
      },
    );
  }

  Widget textSecondaryForeground() {
    return Builder(
      builder: (context) {
        final themeData = Theme.of(context);
        return DefaultTextStyle.merge(
          child: this,
          style: TextStyle(
            color: themeData.colorScheme.secondaryForeground,
          ),
        );
      },
    );
  }

  Widget textQuote() {
    return Builder(builder: (context) {
      Widget child;
      if (this is WrappedText) {
        child = (this as WrappedText).copyWithStyle(
          (context, theme) => theme.typography.quote,
        );
      } else {
        child = WrappedText(style: (context, theme) => theme.typography.quote, child: this);
      }
      return Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: Theme.of(context).colorScheme.border,
              width: 2,
            ),
          ),
        ),
        padding: const EdgeInsets.only(left: 16),
        child: child,
      );
    });
  }

  Widget textCode() {
    return Builder(builder: (context) {
      final style = DefaultTextStyle.of(context).style;
      final double paddingVertical = style.fontSize! * 0.2;
      final double paddingHorizontal = style.fontSize! * 0.3;
      final ThemeData themeData = Theme.of(context);
      Widget child;
      if (this is WrappedText) {
        child = (this as WrappedText).copyWithStyle(
          (context, theme) => theme.typography.code,
        );
      } else {
        child = WrappedText(style: (context, theme) => theme.typography.code, child: this);
      }
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: paddingVertical,
          horizontal: paddingHorizontal,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.muted,
          borderRadius: themeData.radiuses.r2Circular,
        ),
        child: child,
      );
    });
  }

  Widget textSingleLine() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWith(
        softWrap: (context, theme) => false,
        maxLines: (context, theme) => 1,
      );
    }
    return WrappedText(
      softWrap: (context, theme) => false,
      maxLines: (context, theme) => 1,
      child: this,
    );
  }

  Widget textEllipsis() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWith(
        overflow: (context, theme) => TextOverflow.ellipsis,
      );
    }
    return WrappedText(
      overflow: (context, theme) => TextOverflow.ellipsis,
      child: this,
    );
  }

  Widget textCenter() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWith(
        textAlign: (context, theme) => TextAlign.center,
      );
    }
    return WrappedText(
      textAlign: (context, theme) => TextAlign.center,
      child: this,
    );
  }

  Widget textColor(Color? color) {
    return Builder(
      builder: (context) {
        return DefaultTextStyle.merge(
          child: this,
          style: TextStyle(color: color),
        );
      },
    );
  }

  Widget textRight() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWith(
        textAlign: (context, theme) => TextAlign.right,
      );
    }
    return WrappedText(
      textAlign: (context, theme) => TextAlign.right,
      child: this,
    );
  }

  Widget textLeft() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWith(
        textAlign: (context, theme) => TextAlign.left,
      );
    }
    return WrappedText(
      textAlign: (context, theme) => TextAlign.left,
      child: this,
    );
  }

  Widget textJustify() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWith(
        textAlign: (context, theme) => TextAlign.justify,
      );
    }
    return WrappedText(
      textAlign: (context, theme) => TextAlign.justify,
      child: this,
    );
  }

  Widget textStart() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWith(
        textAlign: (context, theme) => TextAlign.start,
      );
    }
    return WrappedText(
      textAlign: (context, theme) => TextAlign.start,
      child: this,
    );
  }

  Widget textEnd() {
    if (this is WrappedText) {
      return (this as WrappedText).copyWith(
        textAlign: (context, theme) => TextAlign.end,
      );
    }
    return WrappedText(
      textAlign: (context, theme) => TextAlign.end,
      child: this,
    );
  }

  Widget textForeground() {
    return Builder(
      builder: (context) {
        final themeData = Theme.of(context);
        return DefaultTextStyle.merge(
          child: this,
          style: TextStyle(
            color: themeData.colorScheme.foreground,
          ),
        );
      },
    );
  }
}

class UnorderedListData {
  final int depth;

  const UnorderedListData({this.depth = 0});
}

typedef WrappedTextDataBuilder<T> = T Function(BuildContext context, ThemeData theme);

class WrappedText extends StatelessWidget {
  final Widget child;
  final WrappedTextDataBuilder<TextStyle>? style;
  final WrappedTextDataBuilder<TextAlign>? textAlign;
  final WrappedTextDataBuilder<bool>? softWrap;
  final WrappedTextDataBuilder<TextOverflow>? overflow;
  final WrappedTextDataBuilder<int>? maxLines;
  final WrappedTextDataBuilder<TextWidthBasis>? textWidthBasis;

  const WrappedText({
    super.key,
    required this.child,
    this.style,
    this.textAlign,
    this.softWrap,
    this.overflow,
    this.maxLines,
    this.textWidthBasis,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTextStyle.merge(
      child: child,
      style: style?.call(context, theme),
      textAlign: textAlign?.call(context, theme),
      softWrap: softWrap?.call(context, theme),
      overflow: overflow?.call(context, theme),
      maxLines: maxLines?.call(context, theme),
      textWidthBasis: textWidthBasis?.call(context, theme),
    );
  }

  WrappedText copyWith({
    WrappedTextDataBuilder<TextStyle>? style,
    WrappedTextDataBuilder<TextAlign>? textAlign,
    WrappedTextDataBuilder<bool>? softWrap,
    WrappedTextDataBuilder<TextOverflow>? overflow,
    WrappedTextDataBuilder<int>? maxLines,
    WrappedTextDataBuilder<TextWidthBasis>? textWidthBasis,
    Widget? child,
  }) {
    return WrappedText(
      style: style ?? this.style,
      textAlign: textAlign ?? this.textAlign,
      softWrap: softWrap ?? this.softWrap,
      overflow: overflow ?? this.overflow,
      maxLines: maxLines ?? this.maxLines,
      textWidthBasis: textWidthBasis ?? this.textWidthBasis,
      child: child ?? this.child,
    );
  }

  WrappedText copyWithStyle(WrappedTextDataBuilder<TextStyle> style) {
    return WrappedText(
      style: (context, theme) => style(context, theme).merge(this.style?.call(context, theme)),
      textAlign: textAlign,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      textWidthBasis: textWidthBasis,
      child: child,
    );
  }
}

extension IconExtension on Widget {
  /// Size 6
  Widget icon1() {
    return WrappedIcon(data: (context, theme) => theme.icons.s1, child: this);
  }

  /// Size 8
  Widget icon2() {
    return WrappedIcon(data: (context, theme) => theme.icons.s2, child: this);
  }

  /// Size 10
  Widget icon3() {
    return WrappedIcon(data: (context, theme) => theme.icons.s3, child: this);
  }

  /// Size 12
  Widget icon4() {
    return WrappedIcon(data: (context, theme) => theme.icons.s4, child: this);
  }

  /// Size 16
  Widget icon5() {
    return WrappedIcon(data: (context, theme) => theme.icons.s5, child: this);
  }

  /// Size 24
  Widget icon6() {
    return WrappedIcon(data: (context, theme) => theme.icons.s6, child: this);
  }

  /// Size 32
  Widget icon7() {
    return WrappedIcon(data: (context, theme) => theme.icons.s7, child: this);
  }

  /// Size 40
  Widget icon8() {
    return WrappedIcon(data: (context, theme) => theme.icons.s8, child: this);
  }

  /// Size 48
  Widget icon9() {
    return WrappedIcon(data: (context, theme) => theme.icons.s9, child: this);
  }

  /// Size 56
  Widget icon10() {
    return WrappedIcon(data: (context, theme) => theme.icons.s10, child: this);
  }

  /// Size 64
  Widget icon11() {
    return WrappedIcon(data: (context, theme) => theme.icons.s11, child: this);
  }

  Widget iconMutedForeground() {
    return WrappedIcon(data: (context, theme) => IconThemeData(color: theme.colorScheme.mutedForeground), child: this);
  }

  Widget iconDestructiveForeground() {
    return WrappedIcon(
        data: (context, theme) => IconThemeData(color: theme.colorScheme.destructiveForeground), child: this);
  }

  Widget iconPrimaryForeground() {
    return WrappedIcon(
        data: (context, theme) => IconThemeData(color: theme.colorScheme.primaryForeground), child: this);
  }

  Widget iconPrimary() {
    return WrappedIcon(data: (context, theme) => IconThemeData(color: theme.colorScheme.primary), child: this);
  }

  Widget iconSecondary() {
    return WrappedIcon(data: (context, theme) => IconThemeData(color: theme.colorScheme.secondary), child: this);
  }

  Widget iconSecondaryForeground() {
    return WrappedIcon(
        data: (context, theme) => IconThemeData(color: theme.colorScheme.secondaryForeground), child: this);
  }
}

typedef WrappedIconDataBuilder<T> = T Function(BuildContext context, ThemeData theme);

class WrappedIcon extends StatelessWidget {
  final WrappedIconDataBuilder<IconThemeData> data;
  final Widget child;

  const WrappedIcon({
    super.key,
    required this.data,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final icons = data(context, theme);
    return IconTheme.merge(
      data: icons,
      child: child,
    );
  }

  WrappedIcon copyWith({
    WrappedIconDataBuilder<IconThemeData>? data,
  }) {
    return WrappedIcon(
      data: (context, theme) {
        return data?.call(context, theme).merge(this.data(context, theme)) ?? this.data(context, theme);
      },
      child: child,
    );
  }
}

extension SkeletonExtension on Widget {
  Widget asSkeletonSliver({bool enabled = true}) {
    return Skeletonizer(
      enabled: enabled,
      ignoreContainers: false,
      child: this,
    );
  }

  Widget asSkeleton(
      {bool enabled = true, bool leaf = false, Widget? replacement, bool unite = false, AsyncSnapshot? snapshot}) {
    if (snapshot != null) {
      enabled = !snapshot.hasData;
    }
    if (this is Avatar || this is Image) {
      // https://github.com/Milad-Akarie/skeletonizer/issues/17
      return Skeleton.leaf(
        enabled: enabled,
        child: this,
      );
    }
    if (unite) {
      return Skeleton.unite(
        unite: enabled,
        child: this,
      );
    }
    if (replacement != null) {
      return Skeleton.replace(
        replace: enabled,
        child: replacement,
      );
    }
    if (leaf) {
      return Skeleton.leaf(
        enabled: enabled,
        child: this,
      );
    }
    return Skeletonizer(
      enabled: enabled,
      child: this,
    );
  }

  Widget ignoreSkeleton() {
    return Skeleton.ignore(child: this);
  }

  Widget excludeSkeleton({bool exclude = true}) {
    return Skeleton.keep(
      keep: exclude,
      child: this,
    );
  }
}
