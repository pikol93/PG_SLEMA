import 'package:pg_slema/features/settings/logic/application_info_repository.dart';
import 'package:pg_slema/utils/connector/shared_preferences_connector.dart';

class ApplicationInfoRepositoryImpl extends ApplicationInfoRepository {
  static const String serverAddressKey = "serverAddress";

  late String serverAddress;

  /// Do not use this ctor outside this class. If an instance of [ApplicationInfoRepositoryImpl] is needed, then use the [create] method.
  ApplicationInfoRepositoryImpl._();

  @override
  String getServerAddress() {
    return serverAddress;
  }

  @override
  void setServerAddress(String value) {
    serverAddress = value;
    SharedPreferencesConnector.setString(serverAddressKey, value);
  }

  /// Creates a new instance of [ApplicationInfoRepositoryImpl]. Serves as a workaround for dart not allowing async constructors.
  static Future<ApplicationInfoRepositoryImpl> create() async {
    final self = ApplicationInfoRepositoryImpl._();
    self.serverAddress = await SharedPreferencesConnector.getString(
        serverAddressKey, "http://10.0.2.2:8081");
    return self;
  }
}
