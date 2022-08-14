import 'package:mobx/mobx.dart';

part 'favorites_store.g.dart';

class FavoritesStore = _FavoritesStoreBase with _$FavoritesStore;
abstract class _FavoritesStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}