import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:investment_analytics/screens/home/cubit/home_cubit.dart';

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<HomeCubit>().shownPage;
    return SizedBox(
      height: 70.h,
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: context.read<HomeCubit>().onPageChanged,
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
