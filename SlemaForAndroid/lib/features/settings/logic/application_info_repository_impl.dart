import 'package:package_info_plus/package_info_plus.dart';
import 'package:pg_slema/features/settings/logic/application_info_repository.dart';
import 'package:pg_slema/utils/connector/shared_preferences_connector.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class ApplicationInfoRepositoryImpl extends ApplicationInfoRepository
    with Logger {
  static const String serverAddressKey = "serverAddress";
  static const String developerModeKey = "developerMode";

  late String serverAddress;
  late String version;
  late String buildNumber;
  late bool developerMode;

  /// Do not use this ctor outside this class. If an instance of [ApplicationInfoRepositoryImpl] is needed, then use the [create] method.
  ApplicationInfoRepositoryImpl._();

  @override
  String getServerAddress() {
    return serverAddress;
  }

  @override
  void setServerAddress(String value) {
    logger.debug("Setting server address: $value");
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

  @override
  bool isDeveloperMode() {
    return developerMode;
  }

  @override
  void setDeveloperMode(bool value) {
    logger.debug("Setting developer mode: $value");
    developerMode = value;
    SharedPreferencesConnector.setBool(developerModeKey, value);
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
    self.developerMode = await SharedPreferencesConnector.getBool(
      developerModeKey,
      false,
    );

    return self;
  }
}
