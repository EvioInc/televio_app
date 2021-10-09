import 'package:shared_preferences/shared_preferences.dart';

LocalStorageController localStorageController = LocalStorageController();

class LocalStorageController {
  SharedPreferences? _prefs;

  LocalStorageController() {
    init();
  }

  void init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<String?> getUid() async {
    return _getString('uid');
  }

  Future<bool?> setUid(String value) async {
    return await _setString(key: 'uid', value: value);
  }

  Future<bool?> setIdToken(String value) async {
    return await _setString(key: 'idToken', value: value);
  }

  Future<String?> getIdToken() async {
    return _getString('idToken');
  }

  Future<String?> _getString(String key) async {
    _prefs = await SharedPreferences.getInstance();
    try {
      return _prefs!.getString(key);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<bool?> _setString({
    required String key,
    required String value,
  }) async {
    _prefs = await SharedPreferences.getInstance();
    try {
      return _prefs!.setString(key, value);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
