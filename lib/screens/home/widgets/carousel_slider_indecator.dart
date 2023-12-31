import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investment_analytics/shared/cubit/home_cubit.dart';
import 'package:investment_analytics/shared/config/themes.dart';

class CarouselSliderIndecator extends StatelessWidget {
  const CarouselSliderIndecator({super.key});

  double get size => 8.w;
  double get spacing => 10.w;

  @override
  Widget build(BuildContext context) {
    int index = context.watch<HomeCubit>().carouselPageIndex;
    return SizedBox(
      height: size + 2 * spacing,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: context.read<HomeCubit>().items.length,
        itemBuilder: (_, i) {
          bool isSelected = index == i;
          return Container(
            width: size,
            margin: EdgeInsets.symmetric(
              vertical: spacing,
              horizontal: spacing / 2,
            ),
            decoration: BoxDecoration(
              color: isSelected ? AppThemes.fontMain : AppThemes.unselected,
              shape: BoxShape.circle,
            ),
          );
        },
      ),
    );
  }
}
