// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:investment_analytics/shared/models/app/bond_model.dart';

class MockDataModel {
  final int id;
  int investmentAmount;
  double ytm;

  final List<int> terms;
  final List<BondModel> bonds;

  MockDataModel({
    required this.id,
    required this.investmentAmount,
    required this.ytm,
    required this.terms,
    required this.bonds,
  });

  MockDataModel copyWith({
    int? investmentAmount,
    double? ytm,
    List<int>? terms,
    List<BondModel>? bonds,
  }) {
    return MockDataModel(
      id: id,
      investmentAmount: investmentAmount ?? this.investmentAmount,
      ytm: ytm ?? this.ytm,
      terms: terms ?? this.terms,
      bonds: bonds ?? this.bonds,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'investmentAmount': investmentAmount,
      'ytm': ytm,
      'id': id,
      'terms': terms,
      'bonds': bonds.map((x) => x.toMap()).toList(),
    };
  }

  factory MockDataModel.fromMap(Map<String, dynamic> map) {
    return MockDataModel(
        investmentAmount: map['investmentAmount'] as int,
        ytm: map['ytm'] as double,
        id: map['id'] as int,
        terms: List<int>.from((map['terms'] as List<int>)),
        bonds: List<BondModel>.from(
          (map['bonds'] as List).map<BondModel>(
            (x) => BondModel.fromMap(x),
          ),
        ));
  }

  String toJson() => json.encode(toMap());

  factory MockDataModel.fromJson(String source) =>
      MockDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MockDataModel( id: $id,investmentAmount: $investmentAmount, ytm: $ytm, terms: $terms, bonds: $bonds)';
  }

  @override
  bool operator ==(covariant MockDataModel other) {
    if (identical(this, other)) return true;

    return other.investmentAmount == investmentAmount &&
        other.ytm == ytm &&
        other.id == id &&
        listEquals(other.terms, terms) &&
        listEquals(other.bonds, bonds);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        investmentAmount.hashCode ^
        ytm.hashCode ^
        terms.hashCode ^
        bonds.hashCode;
  }
}
