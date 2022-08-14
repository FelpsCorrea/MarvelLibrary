import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:marvel_library/app/constants/config_constants.dart';
import 'package:marvel_library/app/modules/login/domain/usecases/login_google_usecase.dart';
import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final ILoginGoogleUsecase loginGoogleUsecase;
  _LoginStoreBase(this.loginGoogleUsecase);

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
    result.fold((l) => genericDialog(l.message), (r) => setGoogleUser(r));
  }

  @action
  setGoogleUser(GoogleSignInAccount user) {
    googleUser = user;
    Modular.to.navigate('/home/');
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
            child: Text(
              'OK',
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      );
    });
  }
}
