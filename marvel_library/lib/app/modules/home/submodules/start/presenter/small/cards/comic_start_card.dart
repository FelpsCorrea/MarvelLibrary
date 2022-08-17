import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/domain/entities/comic.dart';
import 'package:marvel_library/app/modules/home/submodules/start/presenter/start_store.dart';
import 'package:marvel_library/app/themes/marvel_theme.dart';

class ComicStartCard extends StatefulWidget {
  final Comic comic;
  const ComicStartCard({
    Key? key,
    required this.comic,
  }) : super(key: key);

  @override
  ComicStartCardState createState() => ComicStartCardState();
}

class ComicStartCardState extends State<ComicStartCard> {
  final StartStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        store.getComicById(widget.comic.id);
      },
      child: Container(
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
    );
  }
}
