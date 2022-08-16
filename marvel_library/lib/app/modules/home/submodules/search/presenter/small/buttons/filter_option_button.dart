import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_library/app/modules/home/submodules/search/presenter/search_store.dart';
import 'package:marvel_library/app/themes/marvel_theme.dart';
import 'package:marvel_library/app/themes/opera_theme.dart';

class FilterOptionButton extends StatefulWidget {
  final String content;

  const FilterOptionButton({super.key, required this.content});
  @override
  FilterOptionButtonState createState() => FilterOptionButtonState();
}

class FilterOptionButtonState extends State<FilterOptionButton> {
  final SearchStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return InkWell(
        onTap: () {
          store.setSelectedFilterOption(widget.content);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: MarvelTheme.burgundy[100]!, width: 2),
              color: store.selectedFilterOption == widget.content
                  ? MarvelTheme.burgundy[100]!
                  : MarvelTheme.superDarkGray),
          margin: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
          child: Center(
            child: Text(
              widget.content,
              style: GoogleFonts.notoSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: store.selectedFilterOption == widget.content
                      ? MarvelTheme.neutralHighMedium
                      : MarvelTheme.burgundy[100]!),
            ),
          ),
        ),
      );
    });
  }
}
