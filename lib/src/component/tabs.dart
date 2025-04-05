import 'package:shadcn_flutter/shadcn_flutter.dart';

class Tabs extends StatelessWidget {
  final int index;
  final ValueChanged<int> onChanged;
  final List<TabChild> children;
  final EdgeInsetsGeometry? padding;

  const Tabs({
    super.key,
    required this.index,
    required this.onChanged,
    required this.children,
    this.padding,
  });

  Widget _childBuilder(BuildContext context, TabContainerData data, Widget child) {
    final theme = Theme.of(context);
    final scaling = theme.scaling;
    final i = data.index;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        onChanged(i);
      },
      child: MouseRegion(
        hitTestBehavior: HitTestBehavior.translucent,
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 50), // slightly faster than kDefaultDuration
          alignment: Alignment.center,
          padding: padding ??
              const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ) *
                  scaling,
          decoration: BoxDecoration(
            color: i == index ? theme.colorScheme.background : null,
            borderRadius: BorderRadius.circular(
              theme.radiuses.r3,
            ),
          ),
          child: (i == index ? child.textForeground() : child.textMuted()).text2().textW5(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scaling = theme.scaling;
    return TabContainer(
      selected: index,
      onSelect: onChanged,
      builder: (context, children) {
        return Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.muted,
            borderRadius: BorderRadius.circular(theme.radiuses.r4),
          ),
          padding: const EdgeInsets.all(4) * scaling,
          child: IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: children,
            ).textMuted(),
          ),
        );
      },
      childBuilder: _childBuilder,
      children: children,
    );
  }
}
