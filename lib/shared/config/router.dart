import 'package:flutter/material.dart';
import 'package:investment_analytics/screens/calculator/calculator_layout.dart';

import '../../screens/splash/splash_layout.dart';

class AppRouter {
  static Map<String, Widget Function(dynamic)> router() {
    return {
      '/': (ctx) => const CalculatorScreen(),
      SplashScreen.routeName: (ctx) => const SplashScreen(),
      CalculatorScreen.routeName: (ctx) => const CalculatorScreen(),
    };
  }
}
