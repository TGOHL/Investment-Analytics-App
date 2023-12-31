import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:investment_analytics/shared/helpers/preferences_helper.dart';
import 'package:investment_analytics/shared/services/database.dart';
import 'package:meta/meta.dart';

import 'package:investment_analytics/shared/models/app/bond_model.dart';

part 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  // Timer used to exponentially modify Investment Amount
  Timer? _timer;
  bool _isInitialized = false;

  /// The selected index from terms list
  int _selectedTermIndex = 0;
  final List<BondModel> _bonds = [];
  final List<int> terms = [];
  int _investmentAmount = 0;
  double _ytm = 0;
  CalculatorCubit() : super(CalculatorInitial());

  int get _minimumAmount => 250;

  int get investmentAmount => _investmentAmount;
  double get ytm => _ytm;
  bool get isInitialized => _isInitialized;

  int get selectedTerm => terms[_selectedTermIndex];

  double get capitalAtMaturity => totalInterest + _investmentAmount;

  double get totalInterest => annualInterest * selectedTerm;

  double get annualInterest => _investmentAmount * _ytm / 100;

  int get averageMaturityDate => DateTime.now().year + selectedTerm;

  List<BondModel> get bonds => [..._bonds];

  String get averageRating {
    String res = '';
    int sum = bonds.fold<int>(
        0, (prev, e) => prev += BondRate.values.indexOf(e.rate));
    int index = sum ~/ _bonds.length;
    int avgIndex = index == _bonds.length ? _bonds.length - 1 : _bonds.length;
    res = BondRate.values[avgIndex].name.toUpperCase();

    // If he res ends witt 'P' this means +ve so replace it with '+' sign
    // If he res ends witt 'N' this means -ve so replace it with '-+' sign
    if (res.endsWith('P')) {
      res = res.splitMapJoin(
        'P',
        onMatch: (n) => '+',
        onNonMatch: (m) => m,
      );
    } else if (res.endsWith('N')) {
      res = res.splitMapJoin(
        'N',
        onMatch: (n) => '-',
        onNonMatch: (m) => m,
      );
    }

    return res;
  }

  Future initialize() async {
    try {
      // assume we have a model data with id = 1
      final data = await DatabaseServices().getDataModel(1);

      // get saved instanece of the last selected TermType Index
      _selectedTermIndex = PreferencesHelper().getTermType();

      // get saved instanece of the last used amount
      _investmentAmount =
          PreferencesHelper().getinvestmentAmount() ?? data.investmentAmount;

      // initialize bonds
      _bonds.addAll(data.bonds);

      // initialize ytm
      _ytm = data.ytm;

      // initialize terms
      terms.addAll(data.terms);

      _isInitialized = true;
      emit(CalculatorInitializedState());
    } on Exception catch (e) {
      emit(CalculatorErrorState(e));
    }
  }

  void decreamentAmount() {
    // dont modify if it is equal to  the minimum amount
    if (_investmentAmount == _minimumAmount) return;
    int delta = 10000;
    if (_investmentAmount <= 10000) delta = 1000;

    _investmentAmount -= delta;
    if (_investmentAmount < _minimumAmount) _investmentAmount = _minimumAmount;
    // save the amount locally
    PreferencesHelper().setinvestmentAmount(_investmentAmount);
    emit(CalculatorUpdateState());
  }

  void decreamentAmountLong() {
    _timer = Timer.periodic(const Duration(milliseconds: 150), (timer) {
      // dont modify if it is equal to  the minimum amount
      if (_investmentAmount != _minimumAmount) {
        _investmentAmount ~/= 2;
        if (_investmentAmount < _minimumAmount) {
          _investmentAmount = _minimumAmount;
        }
        emit(CalculatorUpdateState());
      }
    });
  }

  void increamentAmount() {
    if (_investmentAmount <= 10000) {
      _investmentAmount += 1000;
    } else {
      _investmentAmount += 10000;
    }
    // save the amount locally
    PreferencesHelper().setinvestmentAmount(_investmentAmount);
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
    // save the amount locally
    PreferencesHelper().setinvestmentAmount(_investmentAmount);
  }

  void changeTerm(int value) {
    int i = terms.indexOf(value);
    if (i == _selectedTermIndex) return;
    _selectedTermIndex = i;
    // save the term index locally

    PreferencesHelper().setTermType(_selectedTermIndex);
    emit(CalculatorUpdateState());
  }

  void createInvestementAccount() {}
}
