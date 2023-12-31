part of '../../../shared/cubit/calculator_cubit.dart';

@immutable
sealed class CalculatorState {}

final class CalculatorInitial extends CalculatorState {}

final class CalculatorInitializedState extends CalculatorState {}

final class CalculatorUpdateState extends CalculatorState {}

class CalculatorErrorState extends CalculatorState {
  final Exception error;

  CalculatorErrorState(this.error);
}
