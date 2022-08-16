import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/presenter/home_store.dart';
import 'package:marvel_library/app/modules/home/presenter/small/widgets/bottom_navigation_bar_widget.dart';
import 'package:marvel_library/app/themes/marvel_theme.dart';

class SmallHomePage extends StatefulWidget {
  final String title;
  const SmallHomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _SmallHomePageState createState() => _SmallHomePageState();
}

class _SmallHomePageState extends ModularState<SmallHomePage, HomeStore> {
  @override
  void initState() {
    //store.loginGoogle();
    store.setIndexByBottomNavRoute();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: const [
              Expanded(
                child: RouterOutlet(),
              ),
            ],
          ),
          Observer(builder: (_) {
            return store.showBottomNav
                ? const Align(
                    alignment: Alignment.bottomCenter,
                    child: BottomNavigationBarWidget(),
                  )
                : Container();
          })
        ],
      ),
    );
  }
}
