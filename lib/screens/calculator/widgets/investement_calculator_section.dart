import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investment_analytics/screens/calculator/cubit/calculator_cubit.dart';
import 'package:investment_analytics/screens/calculator/widgets/label_value_tile.dart';
import 'package:investment_analytics/screens/calculator/widgets/select_term_section.dart';
import 'package:investment_analytics/shared/config/constants.dart';
import 'package:investment_analytics/shared/config/styles.dart';
import 'package:investment_analytics/shared/config/themes.dart';
import 'package:investment_analytics/shared/widgets/rounded_container.dart';
import 'package:investment_analytics/shared/widgets/widget_spacer.dart';

class InvestmentCalculatorSection extends StatelessWidget {
  const InvestmentCalculatorSection({super.key});

  double get labelValueTileHeight => 27.h;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorCubit, CalculatorState>(
      buildWhen: (_, cur) => cur is CalculatorUpdateState,
      builder: (context, state) {
        final cubit = context.read<CalculatorCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Investment Calculator',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17.sp,
                color: AppThemes.fontMain,
              ),
            ),
            WidgetSpacer(space: AppConstants.space / 2),
            RoundedContainer(
              padding: EdgeInsets.all(24.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Investment Amount',
                    style: AppStyles.secondaryTextStyle,
                  ),
                  WidgetSpacer(space: AppConstants.space / 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _RoundedButton(
                        iconData: Icons.remove,
                        onPressed: cubit.decreamentAmount,
                        onLongPress: cubit.decreamentAmountLong,
                        onLongPressEnd: cubit.stopChangingAmount,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              '\$${moneyFormat.format(cubit.investmentAmount)}',
                              style: AppStyles.mainTextStyle
                                  .copyWith(fontSize: 36.sp),
                            ),
                          ),
                        ),
                      ),
                      _RoundedButton(
                        iconData: Icons.add,
                        onPressed: cubit.increamentAmount,
                        onLongPress: cubit.increamentAmountLong,
                        onLongPressEnd: cubit.stopChangingAmount,
                      )
                    ],
                  ),
                  WidgetSpacer(space: AppConstants.space / 3),
                  RoundedContainer(
                    radius: 4.w,
                    padding:
                        EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
                    color: const Color(0x1A46AF35),
                    child: Text(
                      '${cubit.ytm}% YTM',
                      style: AppStyles.secondaryTextStyle.copyWith(
                        color: const Color(0xFF46AF35),
                      ),
                    ),
                  ),
                  WidgetSpacer(space: AppConstants.space / 2),
                  SelectTermSection(
                    onChanged: cubit.changeTerm,
                    isStreached: false,
                  ),
                  WidgetSpacer(space: AppConstants.space),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: LabelValueTile(
                          label: 'Capital At Maturity',
                          value:
                              '\$${moneyFormat.format(cubit.capitalAtMaturity)}',
                          height: labelValueTileHeight,
                        ),
                      ),
                      SizedBox(width: AppConstants.space),
                      Expanded(
                        child: LabelValueTile(
                          label: 'Total Interest',
                          value: '\$${moneyFormat.format(cubit.totalInterest)}',
                          alignment: LabelValueAlignment.end,
                          height: labelValueTileHeight,
                        ),
                      ),
                    ],
                  ),
                  WidgetSpacer(space: AppConstants.space / 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: LabelValueTile(
                          label: 'Annual Interest',
                          value:
                              '\$${moneyFormat.format(cubit.annualInterest)}',
                          height: labelValueTileHeight,
                        ),
                      ),
                      SizedBox(width: AppConstants.space),
                      Expanded(
                        child: LabelValueTile(
                          label: 'Average Maturity Date',
                          value: '${cubit.averageMaturityDate}',
                          alignment: LabelValueAlignment.end,
                          height: labelValueTileHeight,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

class _RoundedButton extends StatefulWidget {
  final IconData iconData;
  final void Function() onPressed;
  final void Function() onLongPress;
  final void Function() onLongPressEnd;
  const _RoundedButton({
    required this.iconData,
    required this.onPressed,
    required this.onLongPress,
    required this.onLongPressEnd,
  });

  @override
  State<_RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<_RoundedButton> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: pressed
            ? const Color.fromARGB(255, 220, 220, 220)
            : AppThemes.scaffold,
        boxShadow: [
          BoxShadow(
            offset: Offset(0.w, 4.h),
            blurRadius: 6.w,
            color: const Color(0x33989FB9),
          )
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(40),
        color: Colors.transparent,
        child: GestureDetector(
          onTap: widget.onPressed,
          onLongPressDown: (_) => setState(() {
            pressed = true;
          }),
          onLongPressUp: () => setState(() {
            pressed = false;
          }),
          onTapDown: (_) => setState(() {
            pressed = true;
          }),
          onTapUp: (_) => setState(() {
            pressed = false;
          }),
          onLongPress: widget.onLongPress,
          onLongPressEnd: (_) => widget.onLongPressEnd(),
          child: Container(
            padding: EdgeInsets.all(6.w),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Icon(
              widget.iconData,
              color: AppThemes.fontMain,
              size: 28,
            ),
          ),
        ),
      ),
    );
  }
}
