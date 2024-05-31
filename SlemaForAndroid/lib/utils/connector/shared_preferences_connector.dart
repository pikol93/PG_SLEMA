import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesConnector {
  Future<List<String>> getList(String listKey) async {
    final prefs = await SharedPreferences.getInstance();

    List<String>? list = prefs.getStringList(listKey);
    return list ?? List<String>.empty(growable: true);
  }

  Future updateList(List<String> list, String listKey) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setStringList(listKey, list);
  }

  static Future<String> getString(String listKey, String defaultValue) {
    return SharedPreferences.getInstance()
        .then((preferences) => preferences.getString(listKey) ?? defaultValue);
  }

  static Future setString(String listKey, String value) {
    return SharedPreferences.getInstance()
        .then((preferences) => preferences.setString(listKey, value));
  }
}
