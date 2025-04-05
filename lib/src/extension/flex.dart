import 'package:shadcn_flutter/shadcn_flutter.dart';

extension FlexExtension on Flex {
  Widget gap(double gap) {
    return separator(direction == Axis.vertical ? SizedBox(height: gap) : SizedBox(width: gap));
  }

  Widget separator(Widget separator) {
    return SeparatedFlex(
      key: key,
      direction: direction,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      clipBehavior: clipBehavior,
      separator: separator,
      children: children,
    );
  }
}
