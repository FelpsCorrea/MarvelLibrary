import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/presenter/home_store.dart';
import 'package:marvel_library/app/themes/marvel_theme.dart';
import 'package:marvel_library/app/themes/opera_theme.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final String title;
  const BottomNavigationBarWidget(
      {Key? key, this.title = 'BottomNavigationBarWidget'})
      : super(key: key);
  @override
  BottomNavigationBarWidgetState createState() =>
      BottomNavigationBarWidgetState();
}

class BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  final HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              onTap: (value) => store.setIndexBottomNav(value, setRoute: true),
              type: BottomNavigationBarType.fixed,
              currentIndex: store.indexBottomNav,
              selectedItemColor: MarvelTheme.neutralHighPure,
              unselectedItemColor: OperaTheme.mediumPurple,
              backgroundColor: MarvelTheme.dark,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              iconSize: 30,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: "Buscar"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: "Favoritos"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Profile"),
              ],
            ),
          ));
    });
  }
}
