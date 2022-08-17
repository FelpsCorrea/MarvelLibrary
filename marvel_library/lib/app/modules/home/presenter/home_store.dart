import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:marvel_library/app/constants/config_constants.dart';
import 'package:marvel_library/app/modules/home/domain/entities/character.dart';
import 'package:marvel_library/app/modules/home/domain/entities/comic.dart';
import 'package:marvel_library/app/modules/home/domain/usecases/get_characters_usecase.dart';
import 'package:marvel_library/app/modules/home/presenter/small/detail/character/character_detail_page.dart';
import 'package:marvel_library/app/modules/home/presenter/small/detail/comic/comic_detail_page.dart';
import 'package:marvel_library/app/modules/home/presenter/small/detail/creator/creator_detail_page.dart';
import 'package:marvel_library/app/modules/login/domain/usecases/login_google_usecase.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final ILoginGoogleUsecase loginGoogleUsecase;
  final IGetCharactersUsecase getCharactersUsecase;
  HomeStoreBase(this.loginGoogleUsecase, this.getCharactersUsecase);

  /**        FUNÇÕES SOBRE O LOGIN GOOGLE       */

  @observable
  GoogleSignInAccount? googleUser;

  @action
  logoutGoogle() async {
    ConfigConstants.googleSignIn.disconnect();
    googleUser = null;
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
      Modular.to.navigate('/home/search/');
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
  int currentIndexDetail = 0;

  List<Widget> detailPages = [
    const SmallComicDetailPage(),
    const SmallCharacterDetailPage(),
    const SmallCreatorDetailPage()
  ];

  /**  FUNÇÕES DO DETALHE DA HQ */
  @observable
  Comic? currentComic;

  getComicById(int id) {
    currentIndexDetail = 0;
    changeShowBottomNav();
  }

  @observable
  var comicCharactersList = ObservableList<Character>();
}
