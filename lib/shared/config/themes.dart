import 'package:flutter/material.dart';
import 'package:investment_analytics/shared/config/styles.dart';

class AppThemes {
  static const String fontFamily = 'Lato';

  static const Color main = Color(0xFF141416);
  static const Color mainDark = Color.fromARGB(255, 10, 10, 10);
  static const Color mainLight = Color.fromARGB(255, 29, 29, 36);
  static const Color scaffold = Color(0xFFF8F8F8);

  static const Color secondaryLight = Color(0xFFEB8729);
  static const Color secondaryDark = Color(0xFFD0491C);

  static const Color greenLight = Color(0xFF69C275);
  static const Color greenDark = Color(0xFF1D5B26);

  static const Color redLight = Color(0xFFEB2929);
  static const Color redDark = Color(0xFF761515);

  static const Color gray = Color(0xFFA0A0A0);
  static const Color whiteLight = Color(0xFFECECEC);

  static const Color fontMain = Color(0xFF1C2C56);
  static const Color fontSecondary = Color(0xFF77809A);
  static Color unselected = fontSecondary.withOpacity(0.6);

  static const List<Color> mainGradient = [mainLight, main];
  static const List<Color> secondaryGradient = [secondaryLight, secondaryDark];

  static lightTheme(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: scaffold,
        primaryColor: Colors.blue,
        appBarTheme: AppBarTheme.of(context).copyWith(
          color: Colors.transparent,
          elevation: 0,
          titleTextStyle: AppStyles.appbarTextStyle,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.black,
            fontFamily: fontFamily,
            fontSize: 14,
          ),
          titleLarge: TextStyle(color: fontSecondary, fontFamily: fontFamily),
          titleMedium: TextStyle(color: Colors.black, fontFamily: fontFamily),
          titleSmall: TextStyle(color: fontSecondary, fontFamily: fontFamily),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: fontMain,
          unselectedItemColor: unselected,
          unselectedLabelStyle: AppStyles.unselectTabTextStyle,
          selectedLabelStyle: AppStyles.selectTabTextStyle,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  static darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        fontFamily: fontFamily,
        scaffoldBackgroundColor: scaffold,
        primaryColor: Colors.orange,
        appBarTheme: AppBarTheme.of(context).copyWith(
          color: Colors.transparent,
          elevation: 0,
          titleTextStyle: AppStyles.appbarTextStyle,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: fontMain,
            fontFamily: fontFamily,
            fontSize: 14,
          ),
          titleLarge: TextStyle(color: fontSecondary, fontFamily: fontFamily),
          titleMedium: TextStyle(color: fontMain, fontFamily: fontFamily),
          titleSmall: TextStyle(color: fontSecondary, fontFamily: fontFamily),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: fontMain,
          unselectedItemColor: unselected,
          unselectedLabelStyle: AppStyles.unselectTabTextStyle,
          selectedLabelStyle: AppStyles.selectTabTextStyle,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}
