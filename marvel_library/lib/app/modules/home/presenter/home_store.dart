import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:marvel_library/app/constants/config_constants.dart';
import 'package:marvel_library/app/modules/home/domain/usecases/get_characters_usecase.dart';
import 'package:marvel_library/app/modules/login/domain/usecases/login_google_usecase.dart';
import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;
part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final ILoginGoogleUsecase loginGoogleUsecase;
  final IGetCharactersUsecase getCharactersUsecase;
  HomeStoreBase(this.loginGoogleUsecase, this.getCharactersUsecase);

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

  // Variável que armazena o index atual da bottom nav
  @observable
  int indexBottomNav = 0;

  @action
  setIndexBottomNav(int value, {bool setRoute=false}) {
    indexBottomNav = value;

    if(setRoute){
      setRouteByBottomNav();
    }
  }

  setIndexByBottomNavRoute(){
    String uri = Modular.args.uri.path;

    if(uri=="/home/"){
      setIndexBottomNav(0, setRoute: true);
    }

    if(uri.contains('search')){
      setIndexBottomNav(1);
    }
    else if(uri.contains('favorites')){
      setIndexBottomNav(2);
    }
    else if(uri.contains('profile')){
      setIndexBottomNav(3);
    }
    else{
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

  logoutDialog() {
    asuka.showDialog(builder: (context) {
      return AlertDialog(
        title: Text('Aviso'),
        content: Text("Deseja realmente sair?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Não',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              logoutGoogle();
              Modular.to.navigate('/');
            },
            child: Text(
              'Sim',
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      );
    });
  }

  @observable
  bool showBottomNav = true;

  @action
  changeShowBottomNav() {
    showBottomNav = !showBottomNav;
  }
}
