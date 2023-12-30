part of 'splash_layout.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomeScreen(),
      const CalculatorScreen(),
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Scaffold(
                body: pages[context.watch<SplashCubit>().shownPage],
                bottomNavigationBar: const SpalshNavBar(),
              ),
            ),
          );
        },
      ),
    );
  }
}
