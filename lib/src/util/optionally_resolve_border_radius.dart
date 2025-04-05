import 'package:shadcn_flutter/shadcn_flutter.dart';

BorderRadius? optionallyResolveBorderRadius(BuildContext context, BorderRadiusGeometry? radius) {
  if (radius == null) {
    return null;
  }
  if (radius is BorderRadius) {
    return radius;
  }
  return radius.resolve(Directionality.of(context));
}
