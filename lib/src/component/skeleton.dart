import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ShadcnSkeletonizerConfigLayer extends StatelessWidget {
  final ThemeData theme;
  final Widget child;

  const ShadcnSkeletonizerConfigLayer({
    super.key,
    required this.theme,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SkeletonizerConfig(
        data: SkeletonizerConfigData(
          effect: PulseEffect(
            duration: const Duration(seconds: 1),
            from: theme.colorScheme.primary.scaleAlpha(0.05),
            to: theme.colorScheme.primary.scaleAlpha(0.1),
          ),
          enableSwitchAnimation: true,
        ),
        child: child);
  }
}
