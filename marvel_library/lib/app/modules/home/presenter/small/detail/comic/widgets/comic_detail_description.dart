import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_library/app/modules/home/presenter/home_store.dart';
import 'package:marvel_library/app/themes/marvel_theme.dart';
import 'package:marvel_library/app/themes/opera_theme.dart';

class ComicDetailDescriptionWidget extends StatefulWidget {
  final String description;

  const ComicDetailDescriptionWidget({super.key, required this.description});

  @override
  ComicDetailDescriptionWidgetState createState() =>
      ComicDetailDescriptionWidgetState();
}

class ComicDetailDescriptionWidgetState
    extends State<ComicDetailDescriptionWidget> {
  final HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.description,
      textAlign: TextAlign.justify,
      style: GoogleFonts.cousine(
          fontSize: 8,
          fontWeight: FontWeight.w800,
          color: MarvelTheme.neutralHighLight),
    );
  }
}
