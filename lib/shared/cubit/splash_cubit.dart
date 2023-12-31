import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_analytics/shared/cubit/calculator_cubit.dart';
import 'package:investment_analytics/shared/cubit/home_cubit.dart';

import '../models/exeptions/went_wrong.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  int _shownPage = 0;
  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;
  int get shownPage => _shownPage;
  String get username => 'Ibrahim Adel';
  SplashCubit() : super(SplashInitial());

  Future init(CalculatorCubit calculatorCubit, HomeCubit homeCubit) async {
    try {
      WidgetsFlutterBinding.ensureInitialized();

      calculatorCubit.initialize();
      homeCubit.initialize();
      _isInitialized = true;
      emit(SplashInitializedState());
    } on Exception catch (e) {
      emit(SplashErrorState(e));
    } catch (e) {
      emit(SplashErrorState(WentWrongExeption()));
    }
  }

  void onPageChanged(int i) {
    _shownPage = i;
    emit(SplashPageChangedState(i));
  }
}
