import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_library/app/modules/home/presenter/home_store.dart';
import 'package:marvel_library/app/themes/marvel_theme.dart';

class ComicInfoSectionWidget extends StatefulWidget {
  const ComicInfoSectionWidget({Key? key}) : super(key: key);

  @override
  ComicInfoSectionWidgetState createState() => ComicInfoSectionWidgetState();
}

class ComicInfoSectionWidgetState extends State<ComicInfoSectionWidget> {
  final HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 8, bottom: 8),
          child: Text(
            "Informações",
            textAlign: TextAlign.justify,
            style: GoogleFonts.cousine(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: MarvelTheme.neutralHighLight),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "ISBN:",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.cousine(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: MarvelTheme.neutralHighLight),
                      ),
                      SizedBox(width: 4),
                      Text(
                        store.currentComic!.isbn ?? "-",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.cousine(
                            fontSize: 12,
                            fontWeight: FontWeight.w200,
                            color: MarvelTheme.neutralHighLight),
                      )
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "Número de páginas:",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.cousine(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: MarvelTheme.neutralHighLight),
                      ),
                      SizedBox(width: 4),
                      Text(
                        store.currentComic!.pageCount != null
                            ? store.currentComic!.pageCount.toString()
                            : "-",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.cousine(
                            fontSize: 12,
                            fontWeight: FontWeight.w200,
                            color: MarvelTheme.neutralHighLight),
                      )
                    ],
                  )
                ],
              ),
              Column(
                children: [],
              )
            ],
          ),
        ),
      ],
    );
  }
}
