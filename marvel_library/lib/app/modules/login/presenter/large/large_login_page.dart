import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/login/presenter/login_store.dart';

class LargeLoginPage extends StatefulWidget {
  final String title;
  const LargeLoginPage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _LargeLoginPageState createState() => _LargeLoginPageState();
}

class _LargeLoginPageState extends State<LargeLoginPage> {
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
              onPressed: () {},
              child: Icon(
                FeatherIcons.airplay,
                color: Colors.black,
              )),
          SizedBox(height: 40),
          TextButton(
              onPressed: () {
                store.logoutGoogle();
              },
              child: Icon(
                FeatherIcons.play,
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
