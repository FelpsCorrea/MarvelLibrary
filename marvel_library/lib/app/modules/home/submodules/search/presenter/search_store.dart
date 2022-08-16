import 'package:mobx/mobx.dart';

part 'search_store.g.dart';

class SearchStore = _SearchStoreBase with _$SearchStore;
abstract class _SearchStoreBase with Store {

  @observable
  bool searchTextFieldIsSelected = false;

  @action
  changeSearchTextFieldIsSelected(){
    searchTextFieldIsSelected = !searchTextFieldIsSelected;
  }

  
}