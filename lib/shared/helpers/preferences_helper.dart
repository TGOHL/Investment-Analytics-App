import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  static late SharedPreferences _instance;
  static const String investmentAmount = 'investmentAmount';
  static const String termType = 'termType';

  static Future<void> initialize() async {
    _instance = await SharedPreferences.getInstance();
  }

  Future<void> setinvestmentAmount(int amount) async {
    await _instance.setInt(investmentAmount, amount);
    await initialize();
  }

  int? getinvestmentAmount() {
    return _instance.getInt(investmentAmount);
  }

  Future<void> setTermType(int term) async {
    await _instance.setInt(termType, term);
    await initialize();
  }

  int getTermType() {
    return _instance.getInt(termType) ?? 0;
  }
}
