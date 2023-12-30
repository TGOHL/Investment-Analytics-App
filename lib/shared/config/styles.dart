import 'package:flutter/material.dart';
import 'package:investment_analytics/shared/config/themes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static const TextStyle toastTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: Colors.white,
  );

  static TextStyle appbarTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20.sp,
    color: const Color(0xFF050B29),
  );

  static TextStyle mainTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 22.sp,
    color: AppThemes.fontMain,
  );
  static TextStyle secondaryTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 12.sp,
    color: AppThemes.fontSecondary,
  );

  static TextStyle titleTextStyle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 22.sp,
    color: AppThemes.fontMain,
  );
  static TextStyle subtitleTextStyle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 14.sp,
    color: const Color(0xFF0B1222),
  );
  static TextStyle tileTitleTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
    color: Colors.black,
  );
  static TextStyle tileSubtitleTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
    color: const Color(0xFF737373),
  );
  static TextStyle tileTrailingTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
    color: const Color(0xFF46AF35),
  );
  static TextStyle selectTabTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
    color: AppThemes.fontMain,
  );
  static TextStyle unselectTabTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
    color: AppThemes.fontSecondary,
  );
  static TextStyle cardSubtitleTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 23.sp,
    color: AppThemes.fontSecondary,
  );
  static TextStyle cardTitleTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 23.sp,
    color: AppThemes.fontMain,
  );
}
