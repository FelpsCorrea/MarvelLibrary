import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/presenter/home_store.dart';
import 'package:marvel_library/app/modules/home/submodules/start/start_store.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  final String title;
  const StartPage({Key? key, this.title = 'StartPage'}) : super(key: key);
  @override
  StartPageState createState() => StartPageState();
}

class StartPageState extends State<StartPage> {
  final StartStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Modular.get<HomeStore>().changeShowBottomNav();
        Navigator.pop(context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.blue,
      ),
    );
  }
}
