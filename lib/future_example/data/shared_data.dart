import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferancesTimedata {
  Future<SharedPreferences> initShared() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  Future<bool?> saveData(String key, int value) async {
    final pref = await initShared();
    return pref.setInt(key, value);
  }

  Future<int?> getData(String value) async {
    final pref = await initShared();
    return pref.getInt(value);
  }
}
