import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/presenter/home_store.dart';
import 'package:marvel_library/app/modules/home/presenter/small/widgets/bottom_navigation_bar_widget.dart';

class SmallHomePage extends StatefulWidget {
  final String title;
  const SmallHomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  SmallHomePageState createState() => SmallHomePageState();
}

class SmallHomePageState extends State<SmallHomePage> {
  final HomeStore store = Modular.get();

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
