class Box<T> {
  private T the_value;
  Box(T v) {
    this.the_value = v;
  }
  T get() {
    return the_value;
  }
  void set(T v) {
    the_value = v;
  }
}