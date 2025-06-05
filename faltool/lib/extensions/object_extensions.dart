extension FalconToolNullableObject<T> on T? {
  void let(void Function(T data) let) {
    final data = this;
    if (data != null) let(data);
  }
}
