import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/presenter/home_store.dart';
import 'package:marvel_library/app/modules/home/presenter/small/detail/circular_detail_thumb.dart';
import 'package:marvel_library/app/modules/home/presenter/small/detail/comics_section.dart';
import 'package:marvel_library/app/modules/home/presenter/small/detail/detail_title.dart';
import 'package:marvel_library/app/themes/marvel_theme.dart';

class SmallCharacterDetailPage extends StatefulWidget {
  const SmallCharacterDetailPage({Key? key}) : super(key: key);

  @override
  SmallCharacterDetailPageState createState() =>
      SmallCharacterDetailPageState();
}

class SmallCharacterDetailPageState extends State<SmallCharacterDetailPage> {
  final HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return store.currentCharacter != null
          ? Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  MarvelTheme.highDarkGray,
                  MarvelTheme.hyperDarkGray,
                ],
              )),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                                onPressed: () {
                                  store.changeShowBottomNav();
                                },
                                icon: const Icon(FeatherIcons.arrowLeft,
                                    color: MarvelTheme.white, size: 32)),
                          ),
                          const SizedBox(height: 24),
                          CircularDetailThumbWidget(
                              thumbPath:
                                  "${store.currentCharacter!.thumbnail!.path}.${store.currentCharacter!.thumbnail!.extension}"),
                          const SizedBox(height: 24),
                          DetailTitleWidget(
                              title: store.currentCharacter!.name),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    ComicsSection(),
                    SizedBox(height: 50)
                  ],
                ),
              ))
          : Container();
    });
  }
}
