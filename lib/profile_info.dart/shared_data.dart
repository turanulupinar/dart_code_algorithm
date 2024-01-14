import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferancesDataMethods {
  Future<SharedPreferences> sharedInit() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  Future<bool> sharedWriteData(String key, String value) async {
    final pref = await sharedInit();
    return pref.setString(key, value);
  }

  Future<String> sharedReadData(String key) async {
    final pref = await sharedInit();
    return pref.getString(key) ?? "";
  }
}
