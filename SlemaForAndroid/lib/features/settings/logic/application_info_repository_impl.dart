import 'package:package_info_plus/package_info_plus.dart';
import 'package:pg_slema/features/settings/logic/application_info_repository.dart';
import 'package:pg_slema/utils/connector/shared_preferences_connector.dart';

class ApplicationInfoRepositoryImpl extends ApplicationInfoRepository {
  static const String serverAddressKey = "serverAddress";

  late String serverAddress;
  late String version;
  late String buildNumber;

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

  @override
  String getVersion() {
    return version;
  }

  @override
  String getBuildNumber() {
    return buildNumber;
  }

  /// Creates a new instance of [ApplicationInfoRepositoryImpl]. Serves as a workaround for dart not allowing async constructors.
  static Future<ApplicationInfoRepositoryImpl> create() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final self = ApplicationInfoRepositoryImpl._();

    self.serverAddress = await SharedPreferencesConnector.getString(
      serverAddressKey,
      "127.0.0.1",
    );
    self.version = packageInfo.version;
    self.buildNumber = packageInfo.buildNumber;

    return self;
  }
}
