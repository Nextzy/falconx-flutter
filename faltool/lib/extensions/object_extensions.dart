extension FalconToolNullableObject<T> on T? {

  void let(Function(T data) let) {
    T? data = this;
    if (data != null) let(data);
  }
}
