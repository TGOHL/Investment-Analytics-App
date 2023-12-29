import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investment_analytics/shared/helpers/initialization_helper.dart';

import 'shared/config/router.dart';
import 'shared/config/themes.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await InitializationHelper.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (_) => ChampionsCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(392, 850),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Investment Analytics',
            theme: AppThemes.lightTheme(context),
            darkTheme: AppThemes.darkTheme(context),
            themeMode: ThemeMode.light,
            home: child,
            routes: AppRouter.router(),
          );
        },
      ),
    );
  }
}
