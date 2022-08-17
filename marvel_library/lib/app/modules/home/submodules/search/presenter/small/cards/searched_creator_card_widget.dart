import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_library/app/modules/home/domain/entities/creator.dart';
import 'package:marvel_library/app/modules/home/submodules/search/presenter/search_store.dart';
import 'package:marvel_library/app/themes/marvel_theme.dart';

class SearchedCreatorCard extends StatefulWidget {
  final Creator creator;

  const SearchedCreatorCard({super.key, required this.creator});
  @override
  SearchedCreatorCardState createState() => SearchedCreatorCardState();
}

class SearchedCreatorCardState extends State<SearchedCreatorCard> {
  final SearchStore store = Modular.get();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        store.getCreatorById(widget.creator.id);
      },
      child: Container(
        height: 110,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: MarvelTheme.highDarkGray),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 70,
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
                        '${widget.creator.thumbnail!.path}.${widget.creator.thumbnail!.extension}',
                        fit: BoxFit.cover,
                        scale: 5)),
              ),
            ),
            SizedBox(width: 4),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.creator.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.bangers(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: MarvelTheme.neutralHighLight),
                  ),
                  Row(
                    children: [
                      Text(
                        "Número de HQs:",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.cousine(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: MarvelTheme.neutralHighLight),
                      ),
                      SizedBox(width: 4),
                      Text(
                        widget.creator.comicList!.length.toString(),
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.cousine(
                            fontSize: 12,
                            fontWeight: FontWeight.w200,
                            color: MarvelTheme.neutralHighLight),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
