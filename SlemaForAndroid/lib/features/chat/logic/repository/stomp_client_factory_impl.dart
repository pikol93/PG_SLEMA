import 'package:pg_slema/features/chat/logic/repository/stomp_client_factory.dart';
import 'package:pg_slema/features/settings/logic/application_info_repository.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class StompClientFactoryImpl extends StompClientFactory with Logger {
  final ApplicationInfoRepository applicationInfoRepository;

  StompClientFactoryImpl({
    required this.applicationInfoRepository,
  });

  @override
  StompClient createAndActivateStompClient(
    Function(StompFrame) onConnectCallback,
  ) {
    final address = applicationInfoRepository.getServerAddress();
    final webSocketAddress = "ws://$address/chat-register";
    logger.debug("Creating StompClient with address: $webSocketAddress");

    final client = StompClient(
      config: StompConfig(
        url: webSocketAddress,
        onConnect: onConnectCallback,
      ),
    );

    client.activate();
    return client;
  }
}
