import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

abstract class StompClientFactory {
  StompClient createAndActivateStompClient(
    Function(StompFrame) onConnectCallback,
  );
}
