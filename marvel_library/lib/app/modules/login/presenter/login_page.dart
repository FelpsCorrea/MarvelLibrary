import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:marvel_library/app/modules/login/presenter/login_store.dart';

class SignInDemo extends StatefulWidget {
  final String title;
  const SignInDemo({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _SignInDemoState createState() => _SignInDemoState();
}

class _SignInDemoState extends State<SignInDemo> {
  final LoginStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Column(
        children: [
          Observer(builder: (_) {
            return store.googleUser != null
                ? Text(store.googleUser!.displayName!)
                : Text("Sem usuário");
          }),
          SizedBox(height: 40),
          TextButton(
              onPressed: () {
                print("AAAAAAAAAAAAAAAAAAAAA");
                print(store.googleUser);
              },
              child: Icon(
                FeatherIcons.airplay,
                color: Colors.black,
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          store.loginGoogle();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
