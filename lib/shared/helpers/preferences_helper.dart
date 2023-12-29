import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  static late SharedPreferences _instance;
  static const String codeTries = 'codeTries';


  static Future<void> initialize() async {
    _instance = await SharedPreferences.getInstance();
  }

  Future<void> setCodeTries(int count) async {
    await _instance.setInt(codeTries, count);
    await initialize();
  }

  int getCodeTries() {
    return _instance.getInt(codeTries) ?? 0;
  }
}
