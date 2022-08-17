import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_library/app/modules/home/presenter/home_store.dart';
import 'package:marvel_library/app/modules/home/presenter/small/detail/comic/widgets/comic_gallery_carousel_widget.dart';
import 'package:marvel_library/app/themes/marvel_theme.dart';

class ComicGallerySectionWidget extends StatefulWidget {
  const ComicGallerySectionWidget({Key? key}) : super(key: key);

  @override
  ComicGallerySectionWidgetState createState() =>
      ComicGallerySectionWidgetState();
}

class ComicGallerySectionWidgetState extends State<ComicGallerySectionWidget> {
  final HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 8, bottom: 8),
          child: Text(
            "Galeria",
            textAlign: TextAlign.justify,
            style: GoogleFonts.cousine(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: MarvelTheme.neutralHighLight),
          ),
        ),
        ComicGalleryCarouselWidget(),
      ],
    );
  }
}
