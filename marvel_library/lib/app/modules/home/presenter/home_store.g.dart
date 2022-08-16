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
  String toString() {
    return '''
googleUser: ${googleUser},
indexBottomNav: ${indexBottomNav},
showBottomNav: ${showBottomNav}
    ''';
  }
}
