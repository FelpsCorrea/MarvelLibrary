import 'package:mobx/mobx.dart';

part 'hqDetail_store.g.dart';

class HqDetailStore = _HqDetailStoreBase with _$HqDetailStore;
abstract class _HqDetailStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}