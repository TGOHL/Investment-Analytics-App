// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

enum BondRate {
  aaa,
  aap,
  aa,
  aan,
  ap,
  a,
  an,
  bbbp,
  bbb,
  bbbn,
  bbp,
  bb,
  bbn,
  bp,
  b,
  bn,
  ccc,
  cc,
  c,
  d
}

class BondModel {
  final String id;
  final String name;
  final BondRate rate;
  final double apy;
  final String? imageAsset;
  final Color? imageBackgorundColor;
  BondModel({
    required this.id,
    required this.name,
    required this.rate,
    required this.apy,
    this.imageAsset,
    this.imageBackgorundColor,
  });

  String get ratingString {
    String string = rate.name.toUpperCase();
    if (string.endsWith('P')) {
      string = string.splitMapJoin(
        'P',
        onMatch: (n) => '+',
        onNonMatch: (m) => m,
      );
    } else if (string.endsWith('N')) {
      string = string.splitMapJoin(
        'N',
        onMatch: (n) => '-',
        onNonMatch: (m) => m,
      );
    }
    return string;
  }

  BondModel copyWith({
    String? id,
    String? name,
    BondRate? rate,
    double? apy,
    String? imageAsset,
  }) {
    return BondModel(
      id: id ?? this.id,
      name: name ?? this.name,
      rate: rate ?? this.rate,
      apy: apy ?? this.apy,
      imageAsset: imageAsset ?? this.imageAsset,
      imageBackgorundColor: imageBackgorundColor ?? imageBackgorundColor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'rate': ratingString,
      'apy': apy,
      'imageAsset': imageAsset,
      'imageBackgorundColor': imageBackgorundColor,
    };
  }

  factory BondModel.fromMap(Map<String, dynamic> map) {
    String string = (map['rate'] as String).toUpperCase();
    if (string.endsWith('P')) {
      string = string.splitMapJoin(
        'P',
        onMatch: (n) => '+',
        onNonMatch: (m) => m,
      );
    } else if (string.endsWith('N')) {
      string = string.splitMapJoin(
        'N',
        onMatch: (n) => '-',
        onNonMatch: (m) => m,
      );
    }

    return BondModel(
      id: map['id'] as String,
      name: map['name'] as String,
      rate: BondRate.values.firstWhere((element) => element.name == string),
      apy: map['apy'] as double,
      imageAsset: map['imageAsset'] as String,
      imageBackgorundColor: Color(map['imageBackgorundColor'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory BondModel.fromJson(String source) =>
      BondModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BondModel(id: $id, name: $name, rate: $rate, apy: $apy, imageAsset: $imageAsset)';
  }

  @override
  bool operator ==(covariant BondModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.rate == rate &&
        other.apy == apy &&
        other.imageBackgorundColor == imageBackgorundColor &&
        other.imageAsset == imageAsset;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        rate.hashCode ^
        apy.hashCode ^
        imageBackgorundColor.hashCode ^
        imageAsset.hashCode;
  }
}
