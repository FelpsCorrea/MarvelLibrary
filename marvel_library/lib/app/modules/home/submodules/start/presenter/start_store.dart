import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/domain/entities/character.dart';
import 'package:marvel_library/app/modules/home/domain/entities/comic.dart';
import 'package:marvel_library/app/modules/home/domain/entities/creator.dart';
import 'package:marvel_library/app/modules/home/domain/repositories/get_characters_repository.dart';
import 'package:marvel_library/app/modules/home/domain/repositories/get_comics_repository.dart';
import 'package:marvel_library/app/modules/home/domain/repositories/get_creators_repository.dart';
import 'package:marvel_library/app/modules/home/domain/usecases/get_characters_usecase.dart';
import 'package:marvel_library/app/modules/home/domain/usecases/get_comics_usecase.dart';
import 'package:marvel_library/app/modules/home/domain/usecases/get_creators_usecase.dart';
import 'package:marvel_library/app/modules/home/presenter/home_store.dart';
import 'package:mobx/mobx.dart';

part 'start_store.g.dart';

class StartStore = _StartStoreBase with _$StartStore;

abstract class _StartStoreBase with Store {
  final IGetCharactersUsecase getCharactersUsecase;
  final IGetCreatorsUsecase getCreatorsUsecase;
  final IGetComicsUsecase getComicsUsecase;

  _StartStoreBase(this.getCharactersUsecase, this.getCreatorsUsecase,
      this.getComicsUsecase);

  @observable
  int carouselIndex = 0;

  @action
  setCarouselIndex(int value) {
    carouselIndex = value;
  }

  List<String> carouselImageList = [
    'assets/images/carrossel_1.png',
    'assets/images/carrossel_2.png',
    'assets/images/carrossel_3.png',
  ];

  // HQs
  @observable
  var comics = ObservableList<Comic>();

  getComics() async {
    final result = await getComicsUsecase(ParamsGetComics(limit: 5));
    result.fold((l) => null, setComics);
  }

  @action
  setComics(ResponseGetComics value) {
    comics.clear();
    comics.addAll(value.comics);
  }

  // Personagens
  @observable
  var characters = ObservableList<Character>();

  getCharacters() async {
    final result = await getCharactersUsecase(ParamsGetCharacters(limit: 5));
    result.fold((l) => null, setcharacters);
  }

  @action
  setcharacters(ResponseGetCharacters value) {
    characters.clear();
    characters.addAll(value.characters);
  }

  // Criadores
  @observable
  var creators = ObservableList<Creator>();

  getCreators() async {
    final result = await getCreatorsUsecase(ParamsGetCreators(limit: 5));
    result.fold((l) => null, setCreators);
  }

  @action
  setCreators(ResponseGetCreators value) {
    creators.clear();
    creators.addAll(value.creators);
  }

  // Alternar a aba que está acessando na bottom nav
  setIndexBottomNav(int index) {
    Modular.get<HomeStore>().setIndexBottomNav(index);
  }

  // Função para abrir o detalhe do quadrinho
  // Função para buscar o detalhe da HQ
  getComicById(int id) {
    Modular.get<HomeStore>().getComicById(id);
  }
}
