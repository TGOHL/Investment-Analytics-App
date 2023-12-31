part of 'calculator_layout.dart';

class CalculatorView extends StatelessWidget {
  const CalculatorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(!context.watch<CalculatorCubit>().isInitialized){
      return const LoadingScreen();
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppText.investmentBarName,
          style: AppStyles.appbarTextStyle,
        ),
      ),
      floatingActionButton: Padding(
        padding:  EdgeInsets.symmetric(horizontal: AppConstants.contentPadding),
        child: MainButton(
          onPressed: context.read<CalculatorCubit>().createInvestementAccount,
          width: double.infinity,
          label: 'Create Investment Account',
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: BlocBuilder<CalculatorCubit, CalculatorState>(
        builder: (context, state) {
          final cubit = context.read<CalculatorCubit>();
          return SafeArea(
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.contentPadding,
              ),
              children: [
                WidgetSpacer(space: 14.h),
                Text(
                  AppText.investmentTitle,
                  style: AppStyles.titleTextStyle.copyWith(
                    color: const Color(0xFF0B1222),
                  ),
                ),
                WidgetSpacer(space: 4.h),
                Text(
                  AppText.investmentSubtitle,
                  style: AppStyles.subtitleTextStyle,
                ),
                const WidgetSpacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppText.ytm,
                      style: AppStyles.secondaryTextStyle.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                    Icon(
                      Icons.info,
                      size: 18.w,
                      color: AppThemes.fontSecondary,
                    )
                  ],
                ),
                WidgetSpacer(space: 6.h),
                Text(
                  '${cubit.ytm}%',
                  textAlign: TextAlign.center,
                  style: AppStyles.titleTextStyle.copyWith(fontSize: 31.sp),
                ),
                WidgetSpacer(space: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LabelValueTile(
                      label: 'Average Rating',
                      value: cubit.averageRating,
                    ),
                    LabelValueTile(
                      label: 'Bonds',
                      value: '${cubit.bonds.length} Companies',
                      alignment: LabelValueAlignment.end,
                    ),
                  ],
                ),
                WidgetSpacer(space: 16.h),
                Text(
                  'Term Types',
                  textAlign: TextAlign.start,
                  style: AppStyles.secondaryTextStyle,
                ),
                const SelectTermSection(),
                WidgetSpacer(space: 36.h),
                const InvestmentCalculatorSection(),
                const WidgetSpacer(),
                const InvestmentBondsSection(),
                WidgetSpacer(space: AppConstants.space * 3),
              ],
            ),
          );
        },
      ),
    );
  }
}
