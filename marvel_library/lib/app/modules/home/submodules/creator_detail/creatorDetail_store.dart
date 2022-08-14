import 'package:mobx/mobx.dart';

part 'creatorDetail_store.g.dart';

class CreatorDetailStore = _CreatorDetailStoreBase with _$CreatorDetailStore;
abstract class _CreatorDetailStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}