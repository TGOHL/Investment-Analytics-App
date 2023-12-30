import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investment_analytics/shared/config/constants.dart';
import 'package:investment_analytics/shared/config/styles.dart';
import 'package:investment_analytics/shared/config/themes.dart';

class HomeSectionTitle extends StatelessWidget {
  final String text;
  const HomeSectionTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      padding: EdgeInsets.symmetric(
        vertical: 15.h,
        horizontal: AppConstants.contentPadding,
      ),
      child: Text(
        text,
        style: AppStyles.tileTitleTextStyle.copyWith(
          color: AppThemes.fontMain,
        ),
      ),
    );
  }
}
