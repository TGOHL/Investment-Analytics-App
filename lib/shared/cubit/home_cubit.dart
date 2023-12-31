import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:investment_analytics/shared/models/app/bundle_model.dart';
import 'package:investment_analytics/shared/services/database.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  int _carouselPageIndex = 0;
  bool _isInitialized = false;
  final List<BundleModel> _items = [];

  List<BundleModel> get items => [..._items];
  int get carouselPageIndex => _carouselPageIndex;
  bool get isInitialized => _isInitialized;
  BundleModel get bundleSelected => items[carouselPageIndex];
  HomeCubit() : super(HomeInitial());

  Future initialize() async {
    try {
      final data = await DatabaseServices().getBundles();
      _items.addAll(data);
      _isInitialized = true;
      emit(HomeInitializedState());
    } on Exception catch (e) {
      emit(HomeErrorState(e));
    }
  }

  void onCardChaged(int index, CarouselPageChangedReason reason) {
    _carouselPageIndex = index;
    emit(HomeItemChangedState(index));
  }
}
