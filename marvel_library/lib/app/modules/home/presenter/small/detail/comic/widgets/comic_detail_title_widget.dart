import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_library/app/modules/home/presenter/home_store.dart';
import 'package:marvel_library/app/themes/marvel_theme.dart';
import 'package:marvel_library/app/themes/opera_theme.dart';

class ComicDetailTitleWidget extends StatefulWidget {
  final String title;

  const ComicDetailTitleWidget({super.key, required this.title});

  @override
  ComicDetailTitleWidgetState createState() => ComicDetailTitleWidgetState();
}

class ComicDetailTitleWidgetState extends State<ComicDetailTitleWidget> {
  final HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        widget.title,
        textAlign: TextAlign.center,
        style: GoogleFonts.bangers(
          fontSize: 24,
          fontWeight: FontWeight.w800,
          color: MarvelTheme.neutralHighLight,
          shadows: <Shadow>[
            const Shadow(
              offset: Offset(10.0, 10.0),
              blurRadius: 3.0,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            const Shadow(
              offset: Offset(10.0, 10.0),
              blurRadius: 8.0,
              color: OperaTheme.darkPurple,
            ),
          ],
        ),
      ),
    );
  }
}
