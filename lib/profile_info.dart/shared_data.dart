import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferancesDataMethods {
  static const userInfoKey = "user_info_list";

  Future<SharedPreferences> sharedInit() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  Future<bool> saveUserData(String value) async {
    final pref = await sharedInit();
    return pref.setString(userInfoKey, value);
  }

  Future<bool> saveUserListData(List<String> value) async {
    final pref = await sharedInit();
    return pref.setStringList(userInfoKey, value);
  }

  Future<String?> getUserData() async {
    final pref = await sharedInit();
    return pref.getString(userInfoKey);
  }

  Future<List<String?>?> getUserListData() async {
    final pref = await sharedInit();
    return pref.getStringList(userInfoKey);
  }

  Future<bool> deleteUserData() async {
    final pref = await sharedInit();
    pref.clear();
    return pref.remove(userInfoKey);
  }

  Future<bool> sharedSaveData(String key, String value) async {
    final pref = await sharedInit();
    return pref.setString(key, value);
  }

  Future<String> sharedReadData(String key) async {
    final pref = await sharedInit();
    return pref.getString(key) ?? "";
  }
}
