import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investment_analytics/screens/home/cubit/home_cubit.dart';
import 'package:investment_analytics/screens/home/widgets/carousel_slider_indecator.dart';
import 'package:investment_analytics/shared/config/assets.dart';
import 'package:investment_analytics/shared/config/styles.dart';
import 'package:investment_analytics/shared/config/themes.dart';
import 'package:investment_analytics/shared/widgets/rounded_container.dart';
import 'package:investment_analytics/shared/widgets/widget_spacer.dart';

class HomeCarouselSection extends StatelessWidget {
  const HomeCarouselSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 156.h,
            aspectRatio: 16 / 9,
            viewportFraction: 0.9,
            initialPage: cubit.carouselPageIndex,
            enableInfiniteScroll: false,
            onPageChanged: cubit.onCardChaged,
            scrollDirection: Axis.horizontal,
          ),
          items: cubit.items.map((i) {
            return RoundedContainer(
              width: ScreenUtil().screenWidth,
              margin: EdgeInsets.symmetric(horizontal: 6.w),
              showShadow: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'bünd',
                        style: AppStyles.cardTitleTextStyle,
                      ),
                      Text(
                        i.type.name,
                        style: AppStyles.cardSubtitleTextStyle,
                      ),
                      WidgetSpacer(space: 20.h),
                      TextButton.icon(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: AppThemes.scaffold,
                        ),
                        icon: Image.asset(
                          AppAssets.arrow,
                          width: 12.w,
                        ),
                        label: Text(
                          'Start now',
                          style: AppStyles.selectTabTextStyle
                              .copyWith(fontSize: 13.sp),
                        ),
                      ),
                    ],
                  ),
                  Image.asset(i.image),
                ],
              ),
            );
          }).toList(),
        ),
        const CarouselSliderIndecator(),
      ],
    );
  }
}
