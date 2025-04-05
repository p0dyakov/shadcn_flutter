import 'dart:async';

extension FutureOrExtension<T> on FutureOr<T> {
  FutureOr<R> map<R>(R Function(T value) transform) {
    if (this is Future<T>) {
      return (this as Future<T>).then(transform);
    }
    return transform(this as T);
  }

  FutureOr<R> flatMap<R>(FutureOr<R> Function(T value) transform) {
    if (this is Future<T>) {
      return (this as Future<T>).then(transform);
    }
    return transform(this as T);
  }

  FutureOr<R> then<R>(FutureOr<R> Function(T value) transform) {
    if (this is Future<T>) {
      return (this as Future<T>).then(transform);
    }
    return transform(this as T);
  }
}
