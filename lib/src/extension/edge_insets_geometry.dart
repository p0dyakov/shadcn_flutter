import 'package:shadcn_flutter/shadcn_flutter.dart';

extension EdgeInsetsExtension on EdgeInsetsGeometry {
  EdgeInsets optionallyResolve(BuildContext context) {
    if (this is EdgeInsets) {
      return this as EdgeInsets;
    }
    return resolve(Directionality.of(context));
  }
}
