import 'dart:math';

import 'package:shadcn_flutter/shadcn_flutter.dart';

BorderRadius subtractByBorder(BorderRadius radius, double borderWidth) {
  return BorderRadius.only(
    topLeft: _subtractSafe(radius.topLeft, Radius.circular(borderWidth)),
    topRight: _subtractSafe(radius.topRight, Radius.circular(borderWidth)),
    bottomLeft: _subtractSafe(radius.bottomLeft, Radius.circular(borderWidth)),
    bottomRight: _subtractSafe(radius.bottomRight, Radius.circular(borderWidth)),
  );
}

Radius _subtractSafe(Radius a, Radius b) {
  return Radius.elliptical(
    max(0, a.x - b.x),
    max(0, a.y - b.y),
  );
}
