abstract class CustomConverter<T, S> {
  S convertTo(T t);
  T convertFrom(S s);
}