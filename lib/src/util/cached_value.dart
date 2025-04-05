import 'package:shadcn_flutter/shadcn_flutter.dart';

mixin CachedValue {
  bool shouldRebuild(covariant CachedValue oldValue);
}

class CachedValueWidget<T> extends StatefulWidget {
  final T value;
  final Widget Function(BuildContext context, T value) builder;

  const CachedValueWidget({
    super.key,
    required this.value,
    required this.builder,
  });

  @override
  State<StatefulWidget> createState() => _CachedValueWidgetState<T>();
}

class _CachedValueWidgetState<T> extends State<CachedValueWidget<T>> {
  Widget? _cachedWidget;

  @override
  void didUpdateWidget(covariant CachedValueWidget<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (T is CachedValue) {
      if ((widget.value as CachedValue).shouldRebuild(oldWidget.value as CachedValue)) {
        _cachedWidget = null;
      }
    } else {
      if (widget.value != oldWidget.value) {
        _cachedWidget = null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _cachedWidget ??= widget.builder(context, widget.value);
    return _cachedWidget!;
  }
}
