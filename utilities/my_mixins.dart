mixin Logger {
  static void log(String msg) {
    print("\n Log: $msg \n");
  }
  static void error(String msg) {
    print("\n Error: $msg \n");
  }
  static void success(String msg) {
    print("\n Success: $msg \n");
  }
}