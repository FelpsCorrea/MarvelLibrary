import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_library/app/modules/home/submodules/search/presenter/search_store.dart';
import 'package:marvel_library/app/themes/marvel_theme.dart';

class SearchTextFieldWidget extends StatefulWidget {
  final String title;
  const SearchTextFieldWidget({Key? key, this.title = 'SearchTextFieldWidget'}) : super(key: key);
  @override
  SearchTextFieldWidgetState createState() => SearchTextFieldWidgetState();
}
class SearchTextFieldWidgetState extends State<SearchTextFieldWidget> {
  final SearchStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
              onTap: store.changeSearchTextFieldIsSelected,
              onTapCancel: store.changeSearchTextFieldIsSelected,
              child: Observer(
                builder: (_) {
                  return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn,
                        height: 48,
                        decoration: BoxDecoration(
                            color: store.searchTextFieldIsSelected
                                ? MarvelTheme.neutralHighMedium
                                : MarvelTheme.neutralHighPure,
                            borderRadius: BorderRadius.circular(14)),
                        child: TextField(
                          onSubmitted: (A){print("a");},
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
                              hintText: 'Buscar por nome',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  borderSide:
                                      const BorderSide(color: MarvelTheme.neutralHighDark)),
                              hintStyle: GoogleFonts.notoSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: store.searchTextFieldIsSelected
                                      ? MarvelTheme.neutralLowDark
                                      : MarvelTheme.neutralHighDarker),
                              prefixIcon: const Icon(
                                FeatherIcons.search,
                                size: 16,
                                color: MarvelTheme.neutralLowPure,
                              )),
                        ),
                      );
                }
              ),
            );
  }
}