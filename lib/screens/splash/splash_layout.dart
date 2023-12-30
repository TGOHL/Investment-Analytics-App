import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_analytics/screens/calculator/calculator_layout.dart';
import 'package:investment_analytics/screens/home/home_layout.dart';
import 'package:investment_analytics/screens/splash/widgets/nav_bar.dart';
import 'package:investment_analytics/shared/helpers/toast_helper.dart';

import 'cubit/splash_cubit.dart';

part 'splash_view.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splash-screen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..init(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashErrorState) {
            ToastHelper.of(context).showError(state.error.toString());
          }
        },
        child: const SplashView(),
      ),
    );
  }
}
