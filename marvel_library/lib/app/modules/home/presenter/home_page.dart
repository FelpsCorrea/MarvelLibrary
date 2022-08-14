import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/presenter/home_store.dart';
import 'package:marvel_library/app/themes/marvel_theme.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  void initState() {
    store.loginGoogle();
    store.setRouteByIndexBottomNav();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return store.showBottomNav
          ? Scaffold(
              body: Column(
                children: [
                  Expanded(
                    child: RouterOutlet(),
                  )
                ],
              ),
              bottomNavigationBar: Observer(builder: (_) {
                return BottomNavigationBar(
                  onTap: (value) => store.setIndexBottomNav(value),
                  type: BottomNavigationBarType.fixed,
                  currentIndex: store.indexBottomNav,
                  selectedItemColor: MarvelTheme.neutralLowDark,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  iconSize: 30,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: "Home"),
                    BottomNavigationBarItem(
                        icon: Icon(FeatherIcons.search), label: "Buscar"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.favorite), label: "Favoritos"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.logout), label: "Logout"),
                  ],
                );
              }),
            )
          : Scaffold(
              body: Column(
              children: [
                Expanded(
                  child: RouterOutlet(),
                )
              ],
            ));
    });
  }
}
