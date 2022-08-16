import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_library/app/modules/home/submodules/search/presenter/search_store.dart';
import 'package:marvel_library/app/modules/home/submodules/search/presenter/small/buttons/filter_option_button.dart';
import 'package:marvel_library/app/themes/marvel_theme.dart';

class SearchFilterOptionsWidget extends StatefulWidget {
  final String title;
  const SearchFilterOptionsWidget(
      {Key? key, this.title = 'SearchFilterOptionsWidget'})
      : super(key: key);
  @override
  SearchFilterOptionsWidgetState createState() =>
      SearchFilterOptionsWidgetState();
}

class SearchFilterOptionsWidgetState extends State<SearchFilterOptionsWidget> {
  final SearchStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Selecione o filtro",
          style: GoogleFonts.notoSans(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: MarvelTheme.neutralHighMedium),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            FilterOptionButton(content: "HQs"),
            FilterOptionButton(content: "Personagens"),
            FilterOptionButton(content: "Criadores")
          ],
        )
      ],
    );
  }
}
