import 'package:loggy/loggy.dart';

mixin Logger implements LoggyType {
  Loggy<Logger> get logger => loggy;

  @override
  Loggy<Logger> get loggy => Loggy<Logger>(runtimeType.toString());
}
