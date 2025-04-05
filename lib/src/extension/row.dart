import 'package:shadcn_flutter/shadcn_flutter.dart';

extension RowExtension on Row {
  Widget gap(double gap) {
    return separator(SizedBox(width: gap));
  }

  Widget separator(Widget separator) {
    return SeparatedFlex(
      key: key,
      direction: Axis.horizontal,
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
