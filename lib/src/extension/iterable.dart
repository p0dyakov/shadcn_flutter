import 'package:shadcn_flutter/shadcn_flutter.dart';

extension IterableExtension<T> on Iterable<T> {
  Iterable<T> joinSeparator(T separator) {
    return map((e) => [separator, e]).expand((element) => element).skip(1);
  }

  Iterable<T> buildSeparator(Supplier<T> separator) {
    return map((e) => [separator(), e]).expand((element) => element).skip(1);
  }
}
