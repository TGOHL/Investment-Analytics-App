part of 'calculator_cubit.dart';

@immutable
sealed class CalculatorState {}

final class CalculatorInitial extends CalculatorState {}

final class CalculatorUpdateState extends CalculatorState {}

class CalculatorErrorState extends CalculatorState {
  final Exception error;

  CalculatorErrorState(this.error);
}
