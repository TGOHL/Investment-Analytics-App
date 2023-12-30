part of 'home_layout.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (_, current) {
                  return true;
                },
                builder: (context, state) {
                  final cubit = context.read<HomeCubit>();
                  return Column(
                    children: [
                      WidgetSpacer(space: 8.h),
                      const HomeHeader(),
                      const HomeCarouselSection(),
                      const HomeSectionTitle(text: 'Conditions'),
                      CustomGridView(
                        data: [
                          MyDataModel(
                            imageAsset: AppAssets.arrow,
                            title: cubit.bundleSelected.minimumDepositText,
                          ),
                          MyDataModel(
                            imageAsset: AppAssets.arrow,
                            title: cubit.bundleSelected.subscriptionText,
                          ),
                        ],
                        columns: 2,
                      ),
                      const HomeSectionTitle(text: 'What You Get'),
                      CustomGridView(
                        data: cubit.bundleSelected.benefits,
                        columns: 3,
                      ),
                    ],
                  );
                },
              ),
            ),
            bottomNavigationBar: const HomeNavBar(),
          ),
        ),
      ),
      CalculatorScreen(),
    ];

    return _pages[context.watch<HomeCubit>().shownPage];
  }
}
