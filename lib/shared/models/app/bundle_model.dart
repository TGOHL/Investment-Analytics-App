// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:investment_analytics/shared/config/assets.dart';
import 'package:investment_analytics/shared/config/constants.dart';

// ignore: constant_identifier_names
enum BundleType { Strandard, Plus, Max, Unlimited }

class BundleModel {
  final int id;
  final BundleType type;
  final String image;
  final int minimumDeposit;
  final int subscription;
  BundleModel({
    required this.id,
    required this.type,
    required this.image,
    required this.minimumDeposit,
    required this.subscription,
  });

  String get minimumDepositText {
    String val = 'No Minimum Deposit';
    if (minimumDeposit > 0) {
      val = '\$${moneyFormat.format(minimumDeposit)} Minimum';
    }
    return val;
  }

  String get subscriptionText {
    String val = 'No Monthly Subscription';
    if (subscription > 0) {
      val = '\$${moneyFormat.format(subscription)}/Month (Paid Annually)';
    }
    return val;
  }

  List<InfoModel> get benefits {
    List<InfoModel> items = [];
    switch (type) {
      case BundleType.Strandard:
        items.add(InfoModel.swissAccount());
        items.add(InfoModel.mastercardPrepaid());
        items.add(InfoModel.openSameDay());
        items.add(InfoModel.protected());
        items.add(InfoModel.investments(false));
        items.add(InfoModel.swissAccount(false));
        break;
      case BundleType.Plus:
        items.add(InfoModel.swissAccount());
        items.add(InfoModel.mastercardCredit());
        items.add(InfoModel.protected());
        items.add(InfoModel.investments());
        items.add(InfoModel.fixedIncome());

        break;
      case BundleType.Max:
        items.add(InfoModel.swissAccount());
        items.add(InfoModel.mastercardCredit());
        items.add(InfoModel.protected());
        items.add(InfoModel.investments());
        items.add(InfoModel.fixedIncome());
        break;
      case BundleType.Unlimited:
        items.add(InfoModel.swissAccount());
        items.add(InfoModel.mastercardCredit());
        items.add(InfoModel.protected());
        items.add(InfoModel.investments());
        items.add(InfoModel.fixedIncome());
        break;
      default:
    }

    return items;
  }

  BundleModel copyWith({
    int? id,
    BundleType? type,
    String? image,
    int? minimumDeposit,
    int? subscription,
  }) {
    return BundleModel(
      id: id ?? this.id,
      type: type ?? this.type,
      image: image ?? this.image,
      minimumDeposit: minimumDeposit ?? this.minimumDeposit,
      subscription: subscription ?? this.subscription,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type.name,
      'image': image,
      'minimumDeposit': minimumDeposit,
      'subscription': subscription,
    };
  }

  factory BundleModel.fromMap(Map<String, dynamic> map) {
    return BundleModel(
      id: map['id'] as int,
      type: BundleType.values
          .firstWhere((element) => element.name == map['type']),
      image: map['image'] as String,
      minimumDeposit: map['minimumDeposit'] as int,
      subscription: map['subscription'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory BundleModel.fromJson(String source) =>
      BundleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'BundleModel(id: $id, type: $type, image: $image, minimumDeposit: $minimumDeposit, subscription: $subscription)';

  @override
  bool operator ==(covariant BundleModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.type == type &&
        other.image == image &&
        other.subscription == subscription &&
        other.minimumDeposit == minimumDeposit;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      type.hashCode ^
      image.hashCode ^
      minimumDeposit.hashCode ^
      subscription.hashCode;
}

class InfoModel {
  final String imageAsset;
  final String title;
  final bool isActive;

  InfoModel({
    required this.imageAsset,
    required this.title,
    this.isActive = true,
  });

  factory InfoModel.swissAccount([bool isActive = true]) {
    return InfoModel(
      imageAsset: AppAssets.subscription,
      title: 'Swiss Bank Account',
      isActive: isActive,
    );
  }
  factory InfoModel.mastercardPrepaid([bool isActive = true]) {
    return InfoModel(
      imageAsset: AppAssets.mastercardPrepaid,
      title: 'Mastercard Prepaid',
      isActive: isActive,
    );
  }
  factory InfoModel.mastercardCredit([bool isActive = true]) {
    return InfoModel(
      imageAsset: AppAssets.mastercardCredit,
      title: 'Mastercard Prepaid',
      isActive: isActive,
    );
  }
  factory InfoModel.openSameDay([bool isActive = true]) {
    return InfoModel(
      imageAsset: AppAssets.accountOpenSameDay,
      title: 'Account Open Same Day',
      isActive: isActive,
    );
  }
  factory InfoModel.protected([bool isActive = true]) {
    return InfoModel(
      imageAsset: AppAssets.protection,
      title: 'Protected up to \$100,000',
      isActive: isActive,
    );
  }

  factory InfoModel.investments([bool isActive = true]) {
    return InfoModel(
      imageAsset: AppAssets.investmentsPortfolios,
      title: 'Investments Portfolios',
      isActive: isActive,
    );
  }
  factory InfoModel.options([bool isActive = true]) {
    return InfoModel(
      imageAsset: AppAssets.depositOptions,
      title: 'Deposits Options',
      isActive: isActive,
    );
  }
  factory InfoModel.fixedIncome([bool isActive = true]) {
    return InfoModel(
      imageAsset: AppAssets.depositOptions,
      title: 'Fixed Income Deposit',
      isActive: isActive,
    );
  }
}
