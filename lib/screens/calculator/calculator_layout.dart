import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investment_analytics/shared/cubit/calculator_cubit.dart';
import 'package:investment_analytics/screens/calculator/widgets/investement_calculator_section.dart';
import 'package:investment_analytics/screens/calculator/widgets/investment_bonds_section.dart';
import 'package:investment_analytics/screens/calculator/widgets/label_value_tile.dart';
import 'package:investment_analytics/screens/calculator/widgets/select_term_section.dart';
import 'package:investment_analytics/shared/config/constants.dart';
import 'package:investment_analytics/shared/config/styles.dart';
import 'package:investment_analytics/shared/config/themes.dart';
import 'package:investment_analytics/shared/helpers/toast_helper.dart';
import 'package:investment_analytics/shared/widgets/loading_screen.dart';

import 'package:investment_analytics/shared/widgets/main_button.dart';
import 'package:investment_analytics/shared/widgets/widget_spacer.dart';

part 'calculator_view.dart';

class CalculatorScreen extends StatelessWidget {
  static const routeName = '/calculator-screen';

  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CalculatorCubit, CalculatorState>(
      listener: (context, state) {
        if (state is CalculatorErrorState) {
          ToastHelper.of(context).showError(state.error.toString());
        }
      },
      child: const CalculatorView(),
    );
  }
}
