import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:marvel_library/app/constants/config_constants.dart';
import 'package:marvel_library/app/modules/login/domain/usecases/login_google_usecase.dart';
import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;
part '../login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final ILoginGoogleUsecase loginGoogleUsecase;
  _LoginStoreBase(this.loginGoogleUsecase);

  @observable
  GoogleSignInAccount? googleUser;

  @action
  loginGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: ConfigConstants.googleClientId,
      scopes: <String>[
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

    // Login Automático
    GoogleSignInAccount? currentUser = await googleSignIn.signInSilently();

    googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      currentUser = account;
    });

    if (currentUser != null) {
      setGoogleUser(currentUser!);
      return;
    }

    // Login
    try {
      currentUser = await googleSignIn.signIn();
    } catch (error) {
      print(error);
    }

    if (currentUser != null) {
      setGoogleUser(currentUser!);
      return;
    }
  }

  @action
  setGoogleUser(GoogleSignInAccount user) {
    print("Entrou no set user");
    googleUser = user;
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
