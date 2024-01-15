mixin CustomConverter<T, S> {
  S to(T t);
  T from(S s);
}
