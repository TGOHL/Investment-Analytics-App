import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investment_analytics/screens/calculator/cubit/calculator_cubit.dart';
import 'package:investment_analytics/screens/calculator/widgets/investement_calculator_section.dart';
import 'package:investment_analytics/screens/calculator/widgets/investment_bonds_section.dart';
import 'package:investment_analytics/screens/calculator/widgets/label_value_tile.dart';
import 'package:investment_analytics/screens/calculator/widgets/select_term_section.dart';
import 'package:investment_analytics/shared/config/assets.dart';
import 'package:investment_analytics/shared/config/constants.dart';
import 'package:investment_analytics/shared/config/styles.dart';
import 'package:investment_analytics/shared/config/themes.dart';
import 'package:investment_analytics/shared/helpers/toast_helper.dart';
import 'package:investment_analytics/shared/models/app/bond_model.dart';
import 'package:investment_analytics/shared/models/app/mock_data_model.dart';
import 'package:investment_analytics/shared/widgets/main_button.dart';
import 'package:investment_analytics/shared/widgets/widget_spacer.dart';

part 'calculator_view.dart';

class CalculatorScreen extends StatelessWidget {
  static const routeName = '/calculator-screen';

  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MockDataModel data = MockDataModel(
      id: 1,
      investmentAmount: 10000,
      ytm: 6.81,
      terms: [3, 5],
      bonds: [
        BondModel(
            id: '1',
            name: 'Netflix INC',
            rate: BondRate.bbb,
            apy: 5.37,
            imageAsset: AppAssets.netflix),
        BondModel(
            id: '2',
            name: 'Ford motor LLC',
            rate: BondRate.bbp,
            apy: 7.71,
            imageAsset: AppAssets.ford),
        BondModel(
            id: '3',
            name: 'Apple INC',
            rate: BondRate.aap,
            apy: 5.85,
            imageAsset: AppAssets.apple),
        BondModel(
            id: '4',
            name: 'Morgan Stanley',
            rate: BondRate.an,
            apy: 6.27,
            imageAsset: AppAssets.morganStanley,
            imageBackgorundColor: const Color(0xFF002C5A)),
      ],
    );
    return BlocProvider(
      create: (context) => CalculatorCubit()..initialize(data),
      child: BlocListener<CalculatorCubit, CalculatorState>(
        listener: (context, state) {
          if (state is CalculatorErrorState) {
            ToastHelper.of(context).showError(state.error.toString());
          }
        },
        child: const CalculatorView(),
      ),
    );
  }
}
