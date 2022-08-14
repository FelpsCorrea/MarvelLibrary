import 'package:mobx/mobx.dart';

part 'characterDetail_store.g.dart';

class CharacterDetailStore = _CharacterDetailStoreBase with _$CharacterDetailStore;
abstract class _CharacterDetailStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}