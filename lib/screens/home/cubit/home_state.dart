part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeUpdateState extends HomeState {}

class HomeErrorState extends HomeState {
  final Exception error;

  HomeErrorState(this.error);
}
class HomeItemChangedState extends HomeState {
  final int index;

  HomeItemChangedState(this.index);
}
class HomeIPageChangedState extends HomeState {
  final int index;

  HomeIPageChangedState(this.index);
}
