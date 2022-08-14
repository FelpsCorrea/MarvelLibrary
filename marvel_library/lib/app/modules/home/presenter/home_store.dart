import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:marvel_library/app/constants/config_constants.dart';
import 'package:marvel_library/app/modules/login/domain/usecases/login_google_usecase.dart';
import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;
part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final ILoginGoogleUsecase loginGoogleUsecase;
  HomeStoreBase(this.loginGoogleUsecase);

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
  setIndexBottomNav(int value) {
    indexBottomNav = value;
    setRouteByIndexBottomNav();
  }

  setRouteByIndexBottomNav() {
    print(googleUser);
    if (indexBottomNav == 0) {
      changeShowBottomNav();
      Modular.to.navigate('/home/start/');
    } else if (indexBottomNav == 1) {
      Modular.to.navigate('/home/search/');
    } else if (indexBottomNav == 2) {
      Modular.to.navigate('/home/favorites/');
    } else {
      logoutDialog();
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
