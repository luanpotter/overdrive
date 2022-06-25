// TODO: idea to extract to dartlin!
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
      results.add(mapper(this.last, this.first));
    }
    return results;
  }
}
