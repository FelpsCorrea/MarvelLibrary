import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_library/app/modules/home/presenter/home_store.dart';
import 'package:marvel_library/app/modules/home/presenter/small/detail/comic_card.dart';
import 'package:marvel_library/app/themes/marvel_theme.dart';

class ComicsSection extends StatefulWidget {
  const ComicsSection({Key? key}) : super(key: key);

  @override
  ComicsSectionState createState() => ComicsSectionState();
}

class ComicsSectionState extends State<ComicsSection> {
  final HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 8, bottom: 8),
          child: Text(
            "HQs",
            textAlign: TextAlign.justify,
            style: GoogleFonts.cousine(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: MarvelTheme.neutralHighLight),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Observer(builder: (_) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...store.comicsList.map((element) {
                  int index = store.comicsList.indexOf(element);

                  // Retorna 2 cards por vez (exceto os dois últimos ou o último, dependendo se o tamanho da lista é par ou impar)
                  if (index % 2 == 0 &&
                      index > 0 &&
                      store.comicsList.length > 1) {
                    return Container(
                      margin: EdgeInsets.only(top: 24),
                      child: Row(
                        children: [
                          ComicCard(comic: store.comicsList[index - 2]),
                          ComicCard(comic: store.comicsList[index - 1])
                        ],
                      ),
                    );
                  }
                  return Container();
                }).toList(),
                // Para retornar os dois últimos elementos caso a lista seja par
                store.comicsList.isNotEmpty && store.comicsList.length % 2 == 0
                    ? Container(
                        margin: EdgeInsets.only(top: 24),
                        child: Row(
                          children: [
                            ComicCard(
                                comic: store
                                    .comicsList[store.comicsList.length - 2]),
                            ComicCard(
                                comic: store
                                    .comicsList[store.comicsList.length - 1])
                          ],
                        ),
                      )
                    : Container(),
                // Para retornar o último elemento caso a lista seja impar
                store.comicsList.isNotEmpty && store.comicsList.length % 2 != 0
                    ? Container(
                        margin: EdgeInsets.only(top: 24),
                        child: ComicCard(
                            comic:
                                store.comicsList[store.comicsList.length - 1]),
                      )
                    : Container()
              ],
            );
          }),
        ),
      ],
    );
  }
}
