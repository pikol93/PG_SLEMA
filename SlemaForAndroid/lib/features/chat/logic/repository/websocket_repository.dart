import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

mixin WebsocketRepository {
  late StompClient client;
  StompClient createAndActivateStompClient(
      Function(StompFrame) onConnectCallback) {
    client = StompClient(
        config: StompConfig(
      url: 'ws://10.0.2.2:8081/chat-register',
      onConnect: onConnectCallback,
    ));
    client.activate();
    return client;
  }
}
