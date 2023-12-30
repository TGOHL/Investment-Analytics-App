import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:investment_analytics/shared/models/app/mock_data_model.dart';
import 'package:meta/meta.dart';

import 'package:investment_analytics/shared/models/app/bond_model.dart';

part 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  Timer? _timer;
  int _selectedTermIndex = 0;
  final List<BondModel> _bonds = [];
  final List<int> terms = [];
  int _investmentAmount = 0;
  double ytm = 0;
  CalculatorCubit() : super(CalculatorInitial());

  int get investmentAmount => _investmentAmount;

  int get selectedTerm => terms[_selectedTermIndex];

  double get capitalAtMaturity => totalInterest + _investmentAmount;

  double get totalInterest => annualInterest * selectedTerm;

  double get annualInterest => _investmentAmount * ytm / 100;

  int get averageMaturityDate => DateTime.now().year + selectedTerm;

  List<BondModel> get bonds => [..._bonds];

  String get averageRating {
    String res = '';
    int sum = bonds.fold<int>(
        0, (prev, e) => prev += BondRate.values.indexOf(e.rate));
    int index = sum ~/ _bonds.length;
    res = BondRate
        .values[index == _bonds.length ? _bonds.length - 1 : _bonds.length]
        .name;
    if (res.toUpperCase().endsWith('P')) {
      res = res.toUpperCase().splitMapJoin(
            'P',
            onMatch: (n) => '+',
            onNonMatch: (m) => m,
          );
    } else if (res.toUpperCase().endsWith('N')) {
      res = res.toUpperCase().splitMapJoin(
            'N',
            onMatch: (n) => '-',
            onNonMatch: (m) => m,
          );
    }

    return res;
  }

  void initialize(MockDataModel data) {
    _bonds.addAll(data.bonds);
    ytm = data.ytm;
    terms.addAll(data.terms);
    _investmentAmount = data.investmentAmount;
  }

  void decreamentAmount() {
    if (_investmentAmount == 250) return;
    int decreamentValue = 10000;
    if (_investmentAmount <= 10000) decreamentValue = 1000;

    _investmentAmount -= decreamentValue;
    if (_investmentAmount < 250) _investmentAmount = 250;
    emit(CalculatorUpdateState());
  }

  void decreamentAmountLong() {
    _timer = Timer.periodic(const Duration(milliseconds: 150), (timer) {
      _investmentAmount ~/= 2;
      if (_investmentAmount < 250) _investmentAmount = 250;
      emit(CalculatorUpdateState());
    });
  }

  void increamentAmount() {
    if (_investmentAmount <= 10000) {
      _investmentAmount += 1000;
    } else {
      _investmentAmount += 10000;
    }
    emit(CalculatorUpdateState());
  }

  void increamentAmountLong() {
    _timer = Timer.periodic(const Duration(milliseconds: 150), (timer) {
      _investmentAmount *= 2;
      emit(CalculatorUpdateState());
    });
  }

  void stopChangingAmount() {
    _timer?.cancel();
  }

  void changeTerm(int value) {
    int i = terms.indexOf(value);
    if (i == _selectedTermIndex) return;
    _selectedTermIndex = i;
    emit(CalculatorUpdateState());
  }

  void createInvestementAccount() {
  }
}
