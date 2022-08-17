import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_library/app/modules/home/domain/entities/comic.dart';
import 'package:marvel_library/app/modules/home/presenter/home_store.dart';
import 'package:marvel_library/app/themes/marvel_theme.dart';

class ComicCard extends StatefulWidget {
  final Comic comic;
  const ComicCard({
    Key? key,
    required this.comic,
  }) : super(key: key);

  @override
  ComicCardState createState() => ComicCardState();
}

class ComicCardState extends State<ComicCard> {
  final HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        store.getComicById(widget.comic.id, alreadyInDetail: true);
      },
      child: Container(
        height: 170,
        width: 80,
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: Card(
                elevation: 6.0,
                shadowColor: MarvelTheme.neutralLowLight,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    child: Image.network(
                        '${widget.comic.thumbnail!.path}.${widget.comic.thumbnail!.extension}',
                        fit: BoxFit.cover,
                        scale: 4)),
              ),
            ),
            Expanded(
              child: Text(
                widget.comic.title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: GoogleFonts.cousine(
                    fontSize: 8,
                    fontWeight: FontWeight.w800,
                    color: MarvelTheme.neutralHighLight),
              ),
            )
          ],
        ),
      ),
    );
  }
}
