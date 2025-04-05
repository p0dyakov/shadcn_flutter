import 'package:shadcn_flutter/shadcn_flutter.dart';

class SeparatedFlex extends StatefulWidget {
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;
  final List<Widget> children;
  final Axis direction;
  final Widget separator;
  final Clip clipBehavior;

  const SeparatedFlex({
    super.key,
    required this.mainAxisAlignment,
    required this.mainAxisSize,
    required this.crossAxisAlignment,
    this.textDirection,
    required this.verticalDirection,
    this.textBaseline,
    required this.children,
    required this.separator,
    required this.direction,
    this.clipBehavior = Clip.none,
  });

  @override
  State<SeparatedFlex> createState() => _SeparatedFlexState();
}

class _SeparatedFlexState extends State<SeparatedFlex> {
  late List<Widget> _children;

  @override
  void initState() {
    super.initState();
    _children = join(widget.children, widget.separator).toList();
  }

  @override
  void didUpdateWidget(covariant SeparatedFlex oldWidget) {
    super.didUpdateWidget(oldWidget);
    mutateSeparated(widget.children, _children, widget.separator);
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      key: widget.key,
      direction: widget.direction,
      mainAxisAlignment: widget.mainAxisAlignment,
      mainAxisSize: widget.mainAxisSize,
      crossAxisAlignment: widget.crossAxisAlignment,
      textDirection: widget.textDirection,
      verticalDirection: widget.verticalDirection,
      textBaseline: widget.textBaseline,
      clipBehavior: widget.clipBehavior,
      children: _children,
    );
  }
}

Iterable<Widget> join(Iterable<Widget> widgets, Widget separator) {
  return SeparatedIterable(widgets, separator);
}

class IconThemeDataTween extends Tween<IconThemeData> {
  IconThemeDataTween({super.begin, super.end});

  @override
  IconThemeData lerp(double t) => IconThemeData.lerp(begin, end, t);
}
