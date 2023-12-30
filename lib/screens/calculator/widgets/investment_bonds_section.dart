import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investment_analytics/screens/calculator/cubit/calculator_cubit.dart';
import 'package:investment_analytics/shared/config/constants.dart';
import 'package:investment_analytics/shared/config/styles.dart';
import 'package:investment_analytics/shared/config/themes.dart';
import 'package:investment_analytics/shared/widgets/rounded_container.dart';
import 'package:investment_analytics/shared/widgets/widget_spacer.dart';

class InvestmentBondsSection extends StatelessWidget {
  const InvestmentBondsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CalculatorCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bonds',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17.sp,
            color: AppThemes.fontMain,
          ),
        ),
        WidgetSpacer(space: AppConstants.space / 2),
        for (final item in cubit.bonds) ...[
          RoundedContainer(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor:
                    item.imageBackgorundColor ?? AppThemes.scaffold,
                radius: 24.w,
                child: item.imageAsset != null
                    ? Image.asset(item.imageAsset!)
                    : null,
              ),
              title: Text(
                item.name,
                style: AppStyles.tileTitleTextStyle,
              ),
              subtitle: Text(
                item.ratingString,
                style: AppStyles.tileSubtitleTextStyle,
              ),
              trailing: Text(
                '${item.apy}% APY',
                style: AppStyles.tileTrailingTextStyle,
              ),
            ),
          ),
          WidgetSpacer(space: AppConstants.space / 2),
        ]
      ],
    );
  }
}
