abstract class ApplicationInfoRepository {
  String getServerAddress();

  void setServerAddress(String value);

  String getVersion();

  String getBuildNumber();

  bool isDeveloperMode();

  void setDeveloperMode(bool value);
}
