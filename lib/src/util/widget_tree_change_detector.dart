import 'package:shadcn_flutter/shadcn_flutter.dart';

class WidgetTreeChangeDetector extends StatefulWidget {
  final Widget child;
  final void Function() onWidgetTreeChange;

  const WidgetTreeChangeDetector({
    super.key,
    required this.child,
    required this.onWidgetTreeChange,
  });

  @override
  State<WidgetTreeChangeDetector> createState() => _WidgetTreeChangeDetectorState();
}

class _WidgetTreeChangeDetectorState extends State<WidgetTreeChangeDetector> {
  @override
  void initState() {
    super.initState();
    widget.onWidgetTreeChange();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

Widget gap(double gap, {double? crossGap}) {
  return Gap(
    gap,
    crossAxisExtent: crossGap,
  );
}
