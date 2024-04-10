class AddThreadController {
  String threadName = "";
  String message = "";

  bool isValid() {
    return threadName.isNotEmpty;
  }
}
