import 'package:mobx/mobx.dart';

part 'start_store.g.dart';

class StartStore = _StartStoreBase with _$StartStore;

abstract class _StartStoreBase with Store {
  @observable
  int carouselIndex = 0;

  @action
  setCarouselIndex(int value) {
    carouselIndex = value;
  }

  List<String> carouselImageList = [
    'assets/images/carrossel_1.png',
    'assets/images/carrossel_2.png',
    'assets/images/carrossel_3.png',
  ];
}
