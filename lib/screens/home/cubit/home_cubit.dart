import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:investment_analytics/shared/config/assets.dart';
import 'package:investment_analytics/shared/models/app/bundle_model.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  int _carouselPageIndex = 0;
  int _shownPage = 0;
  final List<BundleModel> _items = [
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

  String get username => 'Mehemet Taser';
  List<BundleModel> get items => [..._items];
  int get carouselPageIndex => _carouselPageIndex;
  BundleModel get bundleSelected => items[carouselPageIndex];
  HomeCubit() : super(HomeInitial());

  int get shownPage => _shownPage;

  void init() {}

  void onPageChanged(int i) {
    _shownPage = i;
    emit(HomeIPageChangedState(i));
  }

  void onCardChaged(int index, CarouselPageChangedReason reason) {
    _carouselPageIndex = index;
    emit(HomeItemChangedState(index));
  }
}
