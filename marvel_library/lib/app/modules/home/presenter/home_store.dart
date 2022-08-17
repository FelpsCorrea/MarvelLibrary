import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:marvel_library/app/constants/config_constants.dart';
import 'package:marvel_library/app/modules/home/domain/entities/character.dart';
import 'package:marvel_library/app/modules/home/domain/entities/comic.dart';
import 'package:marvel_library/app/modules/home/domain/entities/creator.dart';
import 'package:marvel_library/app/modules/home/domain/repositories/get_characters_repository.dart';
import 'package:marvel_library/app/modules/home/domain/repositories/get_comics_repository.dart';
import 'package:marvel_library/app/modules/home/domain/repositories/get_creators_repository.dart';
import 'package:marvel_library/app/modules/home/domain/usecases/get_characters_usecase.dart';
import 'package:marvel_library/app/modules/home/domain/usecases/get_comics_usecase.dart';
import 'package:marvel_library/app/modules/home/domain/usecases/get_creators_usecase.dart';
import 'package:marvel_library/app/modules/home/presenter/small/detail/character/character_detail_page.dart';
import 'package:marvel_library/app/modules/home/presenter/small/detail/comic/cards/comic_character_card.dart';
import 'package:marvel_library/app/modules/home/presenter/small/detail/comic/comic_detail_page.dart';
import 'package:marvel_library/app/modules/home/presenter/small/detail/creator/creator_detail_page.dart';
import 'package:marvel_library/app/modules/login/domain/usecases/login_google_usecase.dart';
import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;
part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final ILoginGoogleUsecase loginGoogleUsecase;
  final IGetCharactersUsecase getCharactersUsecase;
  final IGetCreatorsUsecase getCreatorsUsecase;
  final IGetComicsUsecase getComicsUsecase;
  HomeStoreBase(this.loginGoogleUsecase, this.getCharactersUsecase,
      this.getComicsUsecase, this.getCreatorsUsecase);

  /**        FUNÇÕES SOBRE O LOGIN GOOGLE       */

  @observable
  GoogleSignInAccount? googleUser;

  @action
  logoutGoogle() async {
    ConfigConstants.googleSignIn.disconnect();
    googleUser = null;
    Modular.to.navigate('/');
  }

  @action
  loginGoogle() async {
    final result = await loginGoogleUsecase();
    result.fold((l) => Modular.to.navigate('/'), (r) => setGoogleUser(r));
  }

  @action
  setGoogleUser(GoogleSignInAccount user) {
    googleUser = user;
  }

  /**        FUNÇÕES SOBRE A BOTTOM NAV       */
  @observable
  int indexBottomNav = 0;

  @action
  setIndexBottomNav(int value, {bool setRoute = false}) {
    indexBottomNav = value;

    if (setRoute) {
      setRouteByBottomNav();
    }
  }

  setIndexByBottomNavRoute() {
    String uri = Modular.args.uri.path;

    if (uri == "/home/") {
      setIndexBottomNav(0, setRoute: true);
    }

    if (uri.contains('search')) {
      setIndexBottomNav(1);
    } else if (uri.contains('favorites')) {
      setIndexBottomNav(2);
    } else if (uri.contains('profile')) {
      setIndexBottomNav(3);
    } else {
      setIndexBottomNav(0);
    }
  }

  setRouteByBottomNav() {
    if (indexBottomNav == 0) {
      Modular.to.navigate('/home/start/');
    } else if (indexBottomNav == 1) {
      Modular.to.navigate('/home/search/filtered?option=HQs');
    } else if (indexBottomNav == 2) {
      Modular.to.navigate('/home/favorites/');
    } else {
      Modular.to.navigate('/home/profile/');
    }
  }

  @observable
  bool showBottomNav = true;

  @action
  changeShowBottomNav() {
    showBottomNav = !showBottomNav;
  }

  /**  FUNÇÕES DO LOADING */

  @observable
  bool isLoading = false;

  @action
  changeLoadingState() {
    isLoading = !isLoading;
  }

  /** FUNÇÕES SOBRE QUAL DETALHE ABRIR */

  @action
  setCurrentIndexDetail(int value) {
    print("ATUALIZOU O INDEX PARA $value");
    currentDetail = detailPages[value];
    print(currentDetail);
  }

  @observable
  Widget currentDetail = SmallComicDetailPage();

  List<Widget> detailPages = [
    const SmallComicDetailPage(),
    const SmallCharacterDetailPage(),
    const SmallCreatorDetailPage()
  ];

  /**  FUNÇÕES DO DETALHE DA HQ */
  @observable
  Comic? currentComic;

  @action
  getComicById(int id, {bool alreadyInDetail = false}) async {
    setCurrentIndexDetail(0);

    final result = await getComicsUsecase(ParamsGetComics(comicId: id));
    result.fold((l) => genericDialog("Ops! Não encontramos sua HQ"), (r) {
      setCurrentComic(r, alreadyInDetail);
    });
  }

  @action
  setCurrentComic(ResponseGetComics value, bool alreadyInDetail) {
    if (value.comics.isEmpty) {
      genericDialog("Ops! Não encontramos sua HQ");
    } else {
      currentComic = value.comics[0];
      getCharactersByComicId(currentComic!.id);

      if (!alreadyInDetail) {
        changeShowBottomNav();
      }
    }
  }

  getCharactersByComicId(int id) async {
    final result =
        await getCharactersUsecase(ParamsGetCharacters(comics: [id]));
    result.fold((l) {}, (r) {
      setCharacterList(r);
    });
  }

  /** FUNÇÕES DETALHE PERSONAGENS */
  @observable
  Character? currentCharacter;

  getCharacterById(int id, {alreadyInDetail = false}) async {
    setCurrentIndexDetail(1);
    final result =
        await getCharactersUsecase(ParamsGetCharacters(characterId: id));
    result.fold((l) => genericDialog("Ops! Não encontramos seu personagem"),
        (r) {
      setCurrentCharacter(r, alreadyInDetail);
    });
  }

  @action
  setCurrentCharacter(ResponseGetCharacters value, bool alreadyInDetail) {
    if (value.characters.isEmpty) {
      genericDialog("Ops! Não encontramos seu personagem");
    } else {
      currentCharacter = value.characters[0];
      getComicsByCharacterId(currentCharacter!.id);
      if (!alreadyInDetail) {
        changeShowBottomNav();
      }
    }
  }

  getComicsByCharacterId(int id) async {
    final result = await getComicsUsecase(ParamsGetComics(characters: [id]));
    result.fold((l) {}, (r) {
      setComicsList(r);
    });
  }

  /** FUNÇÕES DETALHE CRIADOR */
  @observable
  Creator? currentCreator;

  getCreatorById(int id) async {
    setCurrentIndexDetail(2);

    final result = await getCreatorsUsecase(ParamsGetCreators(creatorId: id));
    result.fold((l) => genericDialog("Ops! Não encontramos seu personagem"),
        setCurrentCreator);
  }

  @action
  setCurrentCreator(ResponseGetCreators value) {
    if (value.creators.isEmpty) {
      genericDialog("Ops! Não encontramos sua HQ");
    } else {
      currentCreator = value.creators[0];
      getComicsByCreatorId(currentCreator!.id);
      changeShowBottomNav();
    }
  }

  getComicsByCreatorId(int id) async {
    final result = await getComicsUsecase(ParamsGetComics(creators: [id]));
    result.fold((l) {}, (r) {
      setComicsList(r);
    });
  }

  // Auxiliares para caso necessário HQs
  @observable
  var comicsList = ObservableList<Comic>();

  @action
  setComicsList(ResponseGetComics value) {
    comicsList.clear();
    comicsList.addAll(value.comics);
  }

  // Auxiliares para caso necessário personagens
  @observable
  var characterList = ObservableList<Character>();

  @action
  setCharacterList(ResponseGetCharacters value) {
    characterList.clear();
    characterList.addAll(value.characters);
  }

  // Funções do carrossel do detalhe
  @observable
  int carouselDetailIndex = 0;

  @action
  setCarouselDetailIndex(int value) {
    carouselDetailIndex = value;
  }

  genericDialog(String message) {
    asuka.showDialog(builder: (context) {
      return AlertDialog(
        title: Text('Aviso'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      );
    });
  }
}
