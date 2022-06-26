import 'package:flame/extensions.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

// TODO(luan): ideas to extract to dartlin!

extension IterableExtensions<T> on Iterable<T> {
  T? minOrNullBy<R extends Comparable<R>>(R Function(T) mapper) {
    return _extremeOrNullBy(mapper, (it) => it < 1);
  }

  T? maxOrNullBy<R extends Comparable<R>>(R Function(T) mapper) {
    return _extremeOrNullBy(mapper, (it) => it > 1);
  }

  T? _extremeOrNullBy<R extends Comparable<R>>(
    R Function(T) mapper,
    bool Function(int) comparison,
  ) {
    if (isEmpty) {
      return null;
    }
    var minElement = first;
    var minValue = mapper(minElement);
    for (final el in skip(1)) {
      final value = mapper(el);
      if (comparison(value.compareTo(minValue))) {
        minValue = value;
        minElement = el;
      }
    }
    return minElement;
  }
}

extension ComparableIterableExtensions<T extends Comparable<T>> on Iterable<T> {
  T? minOrNull() {
    return minOrNullBy((it) => it);
  }

  T? maxOrNull() {
    return maxOrNullBy((it) => it);
  }
}

extension ZipWithNext<T> on List<T> {
  List<R> zipWithNext<R>(
    R Function(T t1, T t2) mapper, {

    /// If set, a final pair from the last element back to the first will be
    /// considered.
    bool loopAround = false,
  }) {
    if (length <= 1) {
      return [];
    }
    final results = <R>[];
    for (var index = 0; index < length - 1; index++) {
      final t1 = this[index];
      final t2 = this[index + 1];
      results.add(mapper(t1, t2));
    }
    if (loopAround) {
      results.add(mapper(last, first));
    }
    return results;
  }
}

extension ToPolygonShape on Rect {
  PolygonShape toPolygonShape() {
    return PolygonShape()..set(toVertices());
  }
}
