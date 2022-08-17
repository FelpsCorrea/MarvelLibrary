// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StartStore on _StartStoreBase, Store {
  late final _$carouselIndexAtom =
      Atom(name: '_StartStoreBase.carouselIndex', context: context);

  @override
  int get carouselIndex {
    _$carouselIndexAtom.reportRead();
    return super.carouselIndex;
  }

  @override
  set carouselIndex(int value) {
    _$carouselIndexAtom.reportWrite(value, super.carouselIndex, () {
      super.carouselIndex = value;
    });
  }

  late final _$comicsAtom =
      Atom(name: '_StartStoreBase.comics', context: context);

  @override
  ObservableList<Comic> get comics {
    _$comicsAtom.reportRead();
    return super.comics;
  }

  @override
  set comics(ObservableList<Comic> value) {
    _$comicsAtom.reportWrite(value, super.comics, () {
      super.comics = value;
    });
  }

  late final _$charactersAtom =
      Atom(name: '_StartStoreBase.characters', context: context);

  @override
  ObservableList<Character> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(ObservableList<Character> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  late final _$creatorsAtom =
      Atom(name: '_StartStoreBase.creators', context: context);

  @override
  ObservableList<Creator> get creators {
    _$creatorsAtom.reportRead();
    return super.creators;
  }

  @override
  set creators(ObservableList<Creator> value) {
    _$creatorsAtom.reportWrite(value, super.creators, () {
      super.creators = value;
    });
  }

  late final _$_StartStoreBaseActionController =
      ActionController(name: '_StartStoreBase', context: context);

  @override
  dynamic setCarouselIndex(int value) {
    final _$actionInfo = _$_StartStoreBaseActionController.startAction(
        name: '_StartStoreBase.setCarouselIndex');
    try {
      return super.setCarouselIndex(value);
    } finally {
      _$_StartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setComics(ResponseGetComics value) {
    final _$actionInfo = _$_StartStoreBaseActionController.startAction(
        name: '_StartStoreBase.setComics');
    try {
      return super.setComics(value);
    } finally {
      _$_StartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setcharacters(ResponseGetCharacters value) {
    final _$actionInfo = _$_StartStoreBaseActionController.startAction(
        name: '_StartStoreBase.setcharacters');
    try {
      return super.setcharacters(value);
    } finally {
      _$_StartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCreators(ResponseGetCreators value) {
    final _$actionInfo = _$_StartStoreBaseActionController.startAction(
        name: '_StartStoreBase.setCreators');
    try {
      return super.setCreators(value);
    } finally {
      _$_StartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
carouselIndex: ${carouselIndex},
comics: ${comics},
characters: ${characters},
creators: ${creators}
    ''';
  }
}
