import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:marvel_library/app/modules/home/domain/entities/character.dart';
import 'package:marvel_library/app/modules/home/presenter/home_store.dart';
import 'package:marvel_library/app/themes/marvel_theme.dart';

class ComicCharactersCardWidget extends StatefulWidget {
  final Character character;
  const ComicCharactersCardWidget({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  ComicCharactersCardWidgetState createState() =>
      ComicCharactersCardWidgetState();
}

class ComicCharactersCardWidgetState extends State<ComicCharactersCardWidget> {
  final HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 120,
      margin: EdgeInsets.only(left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(
                      "${widget.character.thumbnail!.path}.${widget.character.thumbnail!.extension}"),
                  fit: BoxFit.fill),
            ),
          ),
          SizedBox(height: 8),
          Text(
            widget.character.name,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: GoogleFonts.cousine(
                fontSize: 8,
                fontWeight: FontWeight.w800,
                color: MarvelTheme.neutralHighLight),
          )
        ],
      ),
    );
  }
}
