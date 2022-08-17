// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$googleUserAtom =
      Atom(name: 'HomeStoreBase.googleUser', context: context);

  @override
  GoogleSignInAccount? get googleUser {
    _$googleUserAtom.reportRead();
    return super.googleUser;
  }

  @override
  set googleUser(GoogleSignInAccount? value) {
    _$googleUserAtom.reportWrite(value, super.googleUser, () {
      super.googleUser = value;
    });
  }

  late final _$indexBottomNavAtom =
      Atom(name: 'HomeStoreBase.indexBottomNav', context: context);

  @override
  int get indexBottomNav {
    _$indexBottomNavAtom.reportRead();
    return super.indexBottomNav;
  }

  @override
  set indexBottomNav(int value) {
    _$indexBottomNavAtom.reportWrite(value, super.indexBottomNav, () {
      super.indexBottomNav = value;
    });
  }

  late final _$showBottomNavAtom =
      Atom(name: 'HomeStoreBase.showBottomNav', context: context);

  @override
  bool get showBottomNav {
    _$showBottomNavAtom.reportRead();
    return super.showBottomNav;
  }

  @override
  set showBottomNav(bool value) {
    _$showBottomNavAtom.reportWrite(value, super.showBottomNav, () {
      super.showBottomNav = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'HomeStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$currentDetailAtom =
      Atom(name: 'HomeStoreBase.currentDetail', context: context);

  @override
  Widget get currentDetail {
    _$currentDetailAtom.reportRead();
    return super.currentDetail;
  }

  @override
  set currentDetail(Widget value) {
    _$currentDetailAtom.reportWrite(value, super.currentDetail, () {
      super.currentDetail = value;
    });
  }

  late final _$currentComicAtom =
      Atom(name: 'HomeStoreBase.currentComic', context: context);

  @override
  Comic? get currentComic {
    _$currentComicAtom.reportRead();
    return super.currentComic;
  }

  @override
  set currentComic(Comic? value) {
    _$currentComicAtom.reportWrite(value, super.currentComic, () {
      super.currentComic = value;
    });
  }

  late final _$currentCharacterAtom =
      Atom(name: 'HomeStoreBase.currentCharacter', context: context);

  @override
  Character? get currentCharacter {
    _$currentCharacterAtom.reportRead();
    return super.currentCharacter;
  }

  @override
  set currentCharacter(Character? value) {
    _$currentCharacterAtom.reportWrite(value, super.currentCharacter, () {
      super.currentCharacter = value;
    });
  }

  late final _$currentCreatorAtom =
      Atom(name: 'HomeStoreBase.currentCreator', context: context);

  @override
  Creator? get currentCreator {
    _$currentCreatorAtom.reportRead();
    return super.currentCreator;
  }

  @override
  set currentCreator(Creator? value) {
    _$currentCreatorAtom.reportWrite(value, super.currentCreator, () {
      super.currentCreator = value;
    });
  }

  late final _$comicsListAtom =
      Atom(name: 'HomeStoreBase.comicsList', context: context);

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

  late final _$characterListAtom =
      Atom(name: 'HomeStoreBase.characterList', context: context);

  @override
  ObservableList<Character> get characterList {
    _$characterListAtom.reportRead();
    return super.characterList;
  }

  @override
  set characterList(ObservableList<Character> value) {
    _$characterListAtom.reportWrite(value, super.characterList, () {
      super.characterList = value;
    });
  }

  late final _$carouselDetailIndexAtom =
      Atom(name: 'HomeStoreBase.carouselDetailIndex', context: context);

  @override
  int get carouselDetailIndex {
    _$carouselDetailIndexAtom.reportRead();
    return super.carouselDetailIndex;
  }

  @override
  set carouselDetailIndex(int value) {
    _$carouselDetailIndexAtom.reportWrite(value, super.carouselDetailIndex, () {
      super.carouselDetailIndex = value;
    });
  }

  late final _$logoutGoogleAsyncAction =
      AsyncAction('HomeStoreBase.logoutGoogle', context: context);

  @override
  Future logoutGoogle() {
    return _$logoutGoogleAsyncAction.run(() => super.logoutGoogle());
  }

  late final _$loginGoogleAsyncAction =
      AsyncAction('HomeStoreBase.loginGoogle', context: context);

  @override
  Future loginGoogle() {
    return _$loginGoogleAsyncAction.run(() => super.loginGoogle());
  }

  late final _$getComicByIdAsyncAction =
      AsyncAction('HomeStoreBase.getComicById', context: context);

  @override
  Future getComicById(int id, {bool alreadyInDetail = false}) {
    return _$getComicByIdAsyncAction
        .run(() => super.getComicById(id, alreadyInDetail: alreadyInDetail));
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  dynamic setGoogleUser(GoogleSignInAccount user) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setGoogleUser');
    try {
      return super.setGoogleUser(user);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIndexBottomNav(int value, {bool setRoute = false}) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setIndexBottomNav');
    try {
      return super.setIndexBottomNav(value, setRoute: setRoute);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeShowBottomNav() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.changeShowBottomNav');
    try {
      return super.changeShowBottomNav();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeLoadingState() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.changeLoadingState');
    try {
      return super.changeLoadingState();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentIndexDetail(int value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setCurrentIndexDetail');
    try {
      return super.setCurrentIndexDetail(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentComic(ResponseGetComics value, bool alreadyInDetail) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setCurrentComic');
    try {
      return super.setCurrentComic(value, alreadyInDetail);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentCharacter(
      ResponseGetCharacters value, bool alreadyInDetail) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setCurrentCharacter');
    try {
      return super.setCurrentCharacter(value, alreadyInDetail);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentCreator(ResponseGetCreators value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setCurrentCreator');
    try {
      return super.setCurrentCreator(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setComicsList(ResponseGetComics value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setComicsList');
    try {
      return super.setComicsList(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCharacterList(ResponseGetCharacters value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setCharacterList');
    try {
      return super.setCharacterList(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCarouselDetailIndex(int value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setCarouselDetailIndex');
    try {
      return super.setCarouselDetailIndex(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
googleUser: ${googleUser},
indexBottomNav: ${indexBottomNav},
showBottomNav: ${showBottomNav},
isLoading: ${isLoading},
currentDetail: ${currentDetail},
currentComic: ${currentComic},
currentCharacter: ${currentCharacter},
currentCreator: ${currentCreator},
comicsList: ${comicsList},
characterList: ${characterList},
carouselDetailIndex: ${carouselDetailIndex}
    ''';
  }
}
