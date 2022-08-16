import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_library/app/modules/home/submodules/search/presenter/search_store.dart';
import 'package:marvel_library/app/themes/marvel_theme.dart';

class SearchTextFieldWidget extends StatefulWidget {
  final String title;
  const SearchTextFieldWidget({Key? key, this.title = 'SearchTextFieldWidget'})
      : super(key: key);
  @override
  SearchTextFieldWidgetState createState() => SearchTextFieldWidgetState();
}

class SearchTextFieldWidgetState extends State<SearchTextFieldWidget> {
  final SearchStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: MarvelTheme.hyperDarkGray),
      child: TextField(
        style: GoogleFonts.notoSans(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: MarvelTheme.neutralHighLight),
        controller: store.searchTextController,
        onTap: store.changeSearchTextFieldIsSelected,
        cursorColor: MarvelTheme.neutralHighDark,
        onChanged: (value) {
          store.search();
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(0),
            hintText: 'Buscar por nome',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                    width: 2, color: MarvelTheme.neutralHighDarker)),
            hintStyle: GoogleFonts.notoSans(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: store.searchTextFieldIsSelected
                    ? MarvelTheme.neutralHighDarker
                    : MarvelTheme.neutralLowExtra),
            prefixIcon: const Icon(
              FeatherIcons.search,
              size: 16,
              color: MarvelTheme.neutralHighDark,
            )),
      ),
    );
  }
}
