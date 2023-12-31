import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investment_analytics/shared/cubit/home_cubit.dart';
import 'package:investment_analytics/screens/home/widgets/carousel_section.dart';
import 'package:investment_analytics/screens/home/widgets/header.dart';
import 'package:investment_analytics/screens/home/widgets/section_title.dart';
import 'package:investment_analytics/shared/config/assets.dart';
import 'package:investment_analytics/shared/helpers/toast_helper.dart';
import 'package:investment_analytics/shared/models/app/bundle_model.dart';
import 'package:investment_analytics/shared/widgets/custom_grid_view.dart';
import 'package:investment_analytics/shared/widgets/loading_screen.dart';
import 'package:investment_analytics/shared/widgets/widget_spacer.dart';

part 'home_view.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeErrorState) {
          ToastHelper.of(context).showError(state.error.toString());
        }
      },
      child: const HomeView(),
    );
  }
}
