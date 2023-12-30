import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

var moneyFormat = NumberFormat('###,##0.##', 'en_US');

class AppText {
  static const String investmentTitle = 'Fixed Income Portfolio';
  static const String investmentBarName = 'Fixed Income';
  static const String investmentSubtitle =
      'A fixed income portfolio consists of bonds and other securities providing steady income and relatively lower risk.';
  static const String ytm = 'Annual Yield To Maturity (YTM)';
}

class AppConstants {
  static double space = 30.h;
  static double contentPadding = 16.h;
}
