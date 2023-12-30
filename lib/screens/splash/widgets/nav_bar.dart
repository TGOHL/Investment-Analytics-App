import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:investment_analytics/screens/splash/cubit/splash_cubit.dart';

class SpalshNavBar extends StatelessWidget {
  const SpalshNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<SplashCubit>().shownPage;
    return SizedBox(
      height: 70.h,
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: context.read<SplashCubit>().onPageChanged,
        items: const [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 6),
              child: Icon(FontAwesomeIcons.house),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 6),
              child: Icon(FontAwesomeIcons.chartLine),
            ),
            label: 'Investement',
          ),
        ],
      ),
    );
  }
}
