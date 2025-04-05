import 'package:shadcn_flutter/shadcn_flutter.dart';

typedef Predicate<T> = bool Function(T value);
typedef Supplier<T> = T Function();
typedef Consumer<T> = void Function(T value);
typedef UnaryOperator<T> = T Function(T value);
typedef BinaryOperator<T> = T Function(T a, T b);
typedef ContextedCallback = void Function(BuildContext context);
typedef ContextedValueChanged<T> = void Function(BuildContext context, T value);
typedef NeverWidgetBuilder = Widget Function(
    [dynamic, dynamic, dynamic, dynamic, dynamic, dynamic, dynamic, dynamic, dynamic, dynamic]);
