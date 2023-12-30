import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:investment_analytics/screens/home/cubit/home_cubit.dart';
import 'package:investment_analytics/shared/config/styles.dart';
import 'package:investment_analytics/shared/config/themes.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 22.w,
        child: const Icon(FontAwesomeIcons.user),
      ),
      title: Text(
        'Good mornning',
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 10.sp,
          color: AppThemes.fontSecondary,
        ),
      ),
      subtitle: Text(
        cubit.username,
        style: AppStyles.mainTextStyle.copyWith(fontSize: 14.sp),
      ),
      trailing: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 22.w,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: const Icon(FontAwesomeIcons.solidBell),
          onPressed: () {},
        ),
      ),
    );
  }
}
