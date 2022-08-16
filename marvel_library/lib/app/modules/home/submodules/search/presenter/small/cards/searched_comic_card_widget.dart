import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_library/app/modules/home/domain/entities/comic.dart';
import 'package:marvel_library/app/modules/home/submodules/search/presenter/search_store.dart';
import 'package:marvel_library/app/themes/marvel_theme.dart';

class SearchedComicCard extends StatefulWidget {
  final Comic comic;

  const SearchedComicCard({super.key, required this.comic});
  @override
  SearchedComicCardState createState() => SearchedComicCardState();
}

class SearchedComicCardState extends State<SearchedComicCard> {
  final SearchStore store = Modular.get();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      '${widget.comic.thumbnail!.path}.${widget.comic.thumbnail!.extension}',
                      fit: BoxFit.cover,
                      scale: 5)),
            ),
          ),
          SizedBox(width: 4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.comic.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.bangers(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: MarvelTheme.neutralHighLight),
                    ),
                    widget.comic.serie != null
                        ? Container(
                            margin: const EdgeInsets.only(top: 8),
                            child: Text(
                              widget.comic.serie!.name,
                              style: GoogleFonts.pompiere(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: MarvelTheme.neutralHighDarker),
                            ),
                          )
                        : Container(),
                  ],
                ),
                widget.comic.creatorsList != null &&
                        widget.comic.creatorsList!.isNotEmpty
                    ? Column(
                        children: [
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(child: Container()),
                              Expanded(
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    widget.comic.creatorsList!
                                        .map((e) => e.name)
                                        .toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.josefinSans(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w400,
                                        color: MarvelTheme.neutralHighDarker),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    : Container()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
