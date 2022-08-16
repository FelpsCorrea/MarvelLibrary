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

  late final _$searchTextControllerAtom =
      Atom(name: '_SearchStoreBase.searchTextController', context: context);

  @override
  TextEditingController get searchTextController {
    _$searchTextControllerAtom.reportRead();
    return super.searchTextController;
  }

  @override
  set searchTextController(TextEditingController value) {
    _$searchTextControllerAtom.reportWrite(value, super.searchTextController,
        () {
      super.searchTextController = value;
    });
  }

  late final _$selectedFilterOptionAtom =
      Atom(name: '_SearchStoreBase.selectedFilterOption', context: context);

  @override
  String get selectedFilterOption {
    _$selectedFilterOptionAtom.reportRead();
    return super.selectedFilterOption;
  }

  @override
  set selectedFilterOption(String value) {
    _$selectedFilterOptionAtom.reportWrite(value, super.selectedFilterOption,
        () {
      super.selectedFilterOption = value;
    });
  }

  late final _$currentSectionAtom =
      Atom(name: '_SearchStoreBase.currentSection', context: context);

  @override
  Widget get currentSection {
    _$currentSectionAtom.reportRead();
    return super.currentSection;
  }

  @override
  set currentSection(Widget value) {
    _$currentSectionAtom.reportWrite(value, super.currentSection, () {
      super.currentSection = value;
    });
  }

  late final _$creatorsListAtom =
      Atom(name: '_SearchStoreBase.creatorsList', context: context);

  @override
  ObservableList<Creator> get creatorsList {
    _$creatorsListAtom.reportRead();
    return super.creatorsList;
  }

  @override
  set creatorsList(ObservableList<Creator> value) {
    _$creatorsListAtom.reportWrite(value, super.creatorsList, () {
      super.creatorsList = value;
    });
  }

  late final _$totalCreatorsAtom =
      Atom(name: '_SearchStoreBase.totalCreators', context: context);

  @override
  int get totalCreators {
    _$totalCreatorsAtom.reportRead();
    return super.totalCreators;
  }

  @override
  set totalCreators(int value) {
    _$totalCreatorsAtom.reportWrite(value, super.totalCreators, () {
      super.totalCreators = value;
    });
  }

  late final _$offsetCreatorsAtom =
      Atom(name: '_SearchStoreBase.offsetCreators', context: context);

  @override
  int get offsetCreators {
    _$offsetCreatorsAtom.reportRead();
    return super.offsetCreators;
  }

  @override
  set offsetCreators(int value) {
    _$offsetCreatorsAtom.reportWrite(value, super.offsetCreators, () {
      super.offsetCreators = value;
    });
  }

  late final _$charactersListAtom =
      Atom(name: '_SearchStoreBase.charactersList', context: context);

  @override
  ObservableList<Character> get charactersList {
    _$charactersListAtom.reportRead();
    return super.charactersList;
  }

  @override
  set charactersList(ObservableList<Character> value) {
    _$charactersListAtom.reportWrite(value, super.charactersList, () {
      super.charactersList = value;
    });
  }

  late final _$totalCharactersAtom =
      Atom(name: '_SearchStoreBase.totalCharacters', context: context);

  @override
  int get totalCharacters {
    _$totalCharactersAtom.reportRead();
    return super.totalCharacters;
  }

  @override
  set totalCharacters(int value) {
    _$totalCharactersAtom.reportWrite(value, super.totalCharacters, () {
      super.totalCharacters = value;
    });
  }

  late final _$offsetCharactersAtom =
      Atom(name: '_SearchStoreBase.offsetCharacters', context: context);

  @override
  int get offsetCharacters {
    _$offsetCharactersAtom.reportRead();
    return super.offsetCharacters;
  }

  @override
  set offsetCharacters(int value) {
    _$offsetCharactersAtom.reportWrite(value, super.offsetCharacters, () {
      super.offsetCharacters = value;
    });
  }

  late final _$comicsListAtom =
      Atom(name: '_SearchStoreBase.comicsList', context: context);

  @override
  ObservableList<Comic> get comicsList {
    _$comicsListAtom.reportRead();
    return super.comicsList;
  }

  @override
  set comicsList(ObservableList<Comic> value) {
    _$comicsListAtom.reportWrite(value, super.comicsList, () {
      super.comicsList = value;
    });
  }

  late final _$totalComicsAtom =
      Atom(name: '_SearchStoreBase.totalComics', context: context);

  @override
  int get totalComics {
    _$totalComicsAtom.reportRead();
    return super.totalComics;
  }

  @override
  set totalComics(int value) {
    _$totalComicsAtom.reportWrite(value, super.totalComics, () {
      super.totalComics = value;
    });
  }

  late final _$offsetComicsAtom =
      Atom(name: '_SearchStoreBase.offsetComics', context: context);

  @override
  int get offsetComics {
    _$offsetComicsAtom.reportRead();
    return super.offsetComics;
  }

  @override
  set offsetComics(int value) {
    _$offsetComicsAtom.reportWrite(value, super.offsetComics, () {
      super.offsetComics = value;
    });
  }

  late final _$searchComicsAsyncAction =
      AsyncAction('_SearchStoreBase.searchComics', context: context);

  @override
  Future searchComics() {
    return _$searchComicsAsyncAction.run(() => super.searchComics());
  }

  late final _$searchMoreComicsAsyncAction =
      AsyncAction('_SearchStoreBase.searchMoreComics', context: context);

  @override
  Future searchMoreComics() {
    return _$searchMoreComicsAsyncAction.run(() => super.searchMoreComics());
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
  dynamic setSelectedFilterOption(String value) {
    final _$actionInfo = _$_SearchStoreBaseActionController.startAction(
        name: '_SearchStoreBase.setSelectedFilterOption');
    try {
      return super.setSelectedFilterOption(value);
    } finally {
      _$_SearchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic search() {
    final _$actionInfo = _$_SearchStoreBaseActionController.startAction(
        name: '_SearchStoreBase.search');
    try {
      return super.search();
    } finally {
      _$_SearchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic searchCreators() {
    final _$actionInfo = _$_SearchStoreBaseActionController.startAction(
        name: '_SearchStoreBase.searchCreators');
    try {
      return super.searchCreators();
    } finally {
      _$_SearchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic searchMoreCreators() {
    final _$actionInfo = _$_SearchStoreBaseActionController.startAction(
        name: '_SearchStoreBase.searchMoreCreators');
    try {
      return super.searchMoreCreators();
    } finally {
      _$_SearchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic searchCharacters() {
    final _$actionInfo = _$_SearchStoreBaseActionController.startAction(
        name: '_SearchStoreBase.searchCharacters');
    try {
      return super.searchCharacters();
    } finally {
      _$_SearchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic searchMoreCharacters() {
    final _$actionInfo = _$_SearchStoreBaseActionController.startAction(
        name: '_SearchStoreBase.searchMoreCharacters');
    try {
      return super.searchMoreCharacters();
    } finally {
      _$_SearchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchTextFieldIsSelected: ${searchTextFieldIsSelected},
searchTextController: ${searchTextController},
selectedFilterOption: ${selectedFilterOption},
currentSection: ${currentSection},
creatorsList: ${creatorsList},
totalCreators: ${totalCreators},
offsetCreators: ${offsetCreators},
charactersList: ${charactersList},
totalCharacters: ${totalCharacters},
offsetCharacters: ${offsetCharacters},
comicsList: ${comicsList},
totalComics: ${totalComics},
offsetComics: ${offsetComics}
    ''';
  }
}
