import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_library/app/modules/home/submodules/search/presenter/search_store.dart';
import 'package:marvel_library/app/themes/marvel_theme.dart';

class SearchMoreWidget extends StatefulWidget {
  final String title;
  const SearchMoreWidget({Key? key, this.title = 'SearchMoreWidget'})
      : super(key: key);
  @override
  SearchMoreWidgetState createState() => SearchMoreWidgetState();
}

class SearchMoreWidgetState extends State<SearchMoreWidget> {
  final SearchStore store = Modular.get();
  @override
  void initState() {
    print("CARREGOU O SEARCH MOREE");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        store.searchMore();
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: MarvelTheme.burgundy[100]!, width: 2)),
        margin: const EdgeInsets.only(bottom: 100),
        child: Center(
          child: Text(
            "Carregar mais",
            style: GoogleFonts.notoSans(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: MarvelTheme.burgundy[100]),
          ),
        ),
      ),
    );
  }
}
