part of '../../../shared/cubit/splash_cubit.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashInitializedState extends SplashState {}

class SplashErrorState extends SplashState {
  final Exception error;

  SplashErrorState(this.error);
}

class SplashPageChangedState extends SplashState {
  final int index;

  SplashPageChangedState(this.index);
}
