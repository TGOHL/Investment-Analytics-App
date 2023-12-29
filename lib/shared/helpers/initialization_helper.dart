import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_analytics/shared/config/observer.dart';
import 'package:investment_analytics/shared/helpers/preferences_helper.dart';

class InitializationHelper {
  static Future<void> initialize() async {
    Bloc.observer = MyBlocObserver();
    await PreferencesHelper.initialize();
  }
}
