import 'package:mobx/mobx.dart';

part 'comicDetail_store.g.dart';

class ComicDetailStore = _ComicDetailStoreBase with _$ComicDetailStore;
abstract class _ComicDetailStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}