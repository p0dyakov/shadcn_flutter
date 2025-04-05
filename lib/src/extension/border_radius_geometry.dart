import 'package:shadcn_flutter/shadcn_flutter.dart';

extension BorderRadiusExtension on BorderRadiusGeometry {
  BorderRadius optionallyResolve(BuildContext context) {
    if (this is BorderRadius) {
      return this as BorderRadius;
    }
    return resolve(Directionality.of(context));
  }
}
