import 'package:shadcn_flutter/shadcn_flutter.dart';

extension AlignmentExtension on AlignmentGeometry {
  Alignment optionallyResolve(BuildContext context) {
    // Why?
    // Because this checks first if the alignment is already an Alignment
    // before resolving the alignment based on the directionality of the context.
    if (this is Alignment) {
      return this as Alignment;
    }
    // The code belows also ignores if the alignment is already resolved,
    // but the code below fetches the directionality of the context.
    return resolve(Directionality.of(context));
  }
}
