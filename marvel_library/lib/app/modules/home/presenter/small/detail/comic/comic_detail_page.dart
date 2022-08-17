import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/presenter/home_store.dart';
import 'package:marvel_library/app/themes/marvel_theme.dart';

class SmallComicDetailPage extends StatefulWidget {
  const SmallComicDetailPage({Key? key}) : super(key: key);

  @override
  SmallComicDetailPageState createState() => SmallComicDetailPageState();
}

class SmallComicDetailPageState extends State<SmallComicDetailPage> {
  final HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.yellow,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      store.changeShowBottomNav();
                    },
                    icon: const Icon(FeatherIcons.arrowLeft,
                        color: MarvelTheme.white, size: 32)),
              )
            ],
          ),
        ));
  }
}
