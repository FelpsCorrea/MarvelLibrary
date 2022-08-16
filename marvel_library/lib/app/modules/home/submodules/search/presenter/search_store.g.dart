// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchStore on _SearchStoreBase, Store {
  late final _$searchTextFieldIsSelectedAtom = Atom(
      name: '_SearchStoreBase.searchTextFieldIsSelected', context: context);

  @override
  bool get searchTextFieldIsSelected {
    _$searchTextFieldIsSelectedAtom.reportRead();
    return super.searchTextFieldIsSelected;
  }

  @override
  set searchTextFieldIsSelected(bool value) {
    _$searchTextFieldIsSelectedAtom
        .reportWrite(value, super.searchTextFieldIsSelected, () {
      super.searchTextFieldIsSelected = value;
    });
  }

  late final _$_SearchStoreBaseActionController =
      ActionController(name: '_SearchStoreBase', context: context);

  @override
  dynamic changeSearchTextFieldIsSelected() {
    final _$actionInfo = _$_SearchStoreBaseActionController.startAction(
        name: '_SearchStoreBase.changeSearchTextFieldIsSelected');
    try {
      return super.changeSearchTextFieldIsSelected();
    } finally {
      _$_SearchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchTextFieldIsSelected: ${searchTextFieldIsSelected}
    ''';
  }
}
