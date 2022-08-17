import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/presenter/home_store.dart';
import 'package:marvel_library/app/themes/marvel_theme.dart';

class ComicDetailThumbWidget extends StatefulWidget {
  final String thumbPath;

  const ComicDetailThumbWidget({super.key, required this.thumbPath});

  @override
  ComicDetailThumbWidgetState createState() => ComicDetailThumbWidgetState();
}

class ComicDetailThumbWidgetState extends State<ComicDetailThumbWidget> {
  final HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 175,
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
            child:
                Image.network(widget.thumbPath, fit: BoxFit.cover, scale: 5)),
      ),
    );
  }
}
