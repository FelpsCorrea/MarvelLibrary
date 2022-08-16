import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/submodules/search/presenter/search_store.dart';

class SearchCharactersSection extends StatefulWidget {
  final String title;
  const SearchCharactersSection(
      {Key? key, this.title = 'SearchCharactersSection'})
      : super(key: key);
  @override
  SearchCharactersSectionState createState() => SearchCharactersSectionState();
}

class SearchCharactersSectionState extends State<SearchCharactersSection> {
  final SearchStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue, height: 50);
  }
}
