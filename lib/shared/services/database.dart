import 'dart:ui';

import 'package:investment_analytics/shared/config/assets.dart';
import 'package:investment_analytics/shared/models/app/bond_model.dart';
import 'package:investment_analytics/shared/models/app/bundle_model.dart';
import 'package:investment_analytics/shared/models/app/mock_data_model.dart';
import 'package:investment_analytics/shared/models/exeptions/database.dart';

class DatabaseServices {
  Future<MockDataModel> getDataModel(int id) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final MockDataModel res = MockDataModel(
        id: id,
        investmentAmount: 10000,
        ytm: 6.81,
        terms: [3, 5],
        bonds: await getBondModel(id),
      );
      return res;
    } catch (e) {
      throw DatabaseException('failed to retieve data model');
    }
  }

  Future<List<BondModel>> getBondModel(int id) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final List<BondModel> res = [
        BondModel(
          id: '1',
          name: 'Netflix INC',
          rate: BondRate.bbb,
          apy: 5.37,
          imageAsset: AppAssets.netflix,
        ),
        BondModel(
          id: '2',
          name: 'Ford motor LLC',
          rate: BondRate.bbp,
          apy: 7.71,
          imageAsset: AppAssets.ford,
        ),
        BondModel(
          id: '3',
          name: 'Apple INC',
          rate: BondRate.aap,
          apy: 5.85,
          imageAsset: AppAssets.apple,
        ),
        BondModel(
          id: '4',
          name: 'Morgan Stanley',
          rate: BondRate.an,
          apy: 6.27,
          imageAsset: AppAssets.morganStanley,
          imageBackgorundColor: const Color(0xFF002C5A),
        ),
      ];
      return res;
    } catch (e) {
      throw DatabaseException('failed to retieve bonds');
    }
  }

  Future<List<BundleModel>> getBundles() async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      final List<BundleModel> res = [
        BundleModel(
          id: 1,
          image: AppAssets.dukascopyBank,
          type: BundleType.Strandard,
          minimumDeposit: 0,
          subscription: 15,
        ),
        BundleModel(
          id: 2,
          image: AppAssets.cimBank,
          type: BundleType.Plus,
          minimumDeposit: 10000,
          subscription: 30,
        ),
        BundleModel(
          id: 3,
          image: AppAssets.ubsBank,
          type: BundleType.Max,
          minimumDeposit: 50000,
          subscription: 200,
        ),
        BundleModel(
          id: 4,
          image: AppAssets.ubsBank,
          type: BundleType.Unlimited,
          minimumDeposit: 500000,
          subscription: 0,
        ),
      ];
      return res;
    } catch (e) {
      throw DatabaseException('failed to retieve bundles');
    }
  }
}
