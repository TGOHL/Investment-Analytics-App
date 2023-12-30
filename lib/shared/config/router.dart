import 'package:flutter/material.dart';
import 'package:investment_analytics/screens/calculator/calculator_layout.dart';
import 'package:investment_analytics/screens/home/home_layout.dart';

import '../../screens/splash/splash_layout.dart';

class AppRouter {
  static Map<String, Widget Function(dynamic)> router() {
    return {
      '/': (ctx) => const SplashScreen(),
      SplashScreen.routeName: (ctx) => const SplashScreen(),
      CalculatorScreen.routeName: (ctx) => const CalculatorScreen(),
      HomeScreen.routeName: (ctx) => const HomeScreen(),
    };
  }
}
