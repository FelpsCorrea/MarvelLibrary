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
          height: 170,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Observer(builder: (_) {
            return ListView.builder(
              controller: ScrollController(),
              itemCount: store.comicsList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ComicCard(comic: store.comicsList[index]);
              },
            );
          }),
        ),
      ],
    );
  }
}
