import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_library/app/modules/home/submodules/start/presenter/start_store.dart';
import 'package:marvel_library/app/themes/marvel_theme.dart';

class ViewMoreButton extends StatefulWidget {
  final String goTo;

  const ViewMoreButton({super.key, required this.goTo});

  @override
  ViewMoreButtonState createState() => ViewMoreButtonState();
}

class ViewMoreButtonState extends State<ViewMoreButton> {
  final StartStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        store.setIndexBottomNav(1);
        Modular.to.navigate("/home/search/filtered?option=${widget.goTo}");
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: MarvelTheme.burgundy[100]!, width: 2),
            color: MarvelTheme.burgundy[100]!),
        margin: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
        child: Center(
          child: Text(
            "Ver Mais",
            style: GoogleFonts.notoSans(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: MarvelTheme.white),
          ),
        ),
      ),
    );
  }
}
