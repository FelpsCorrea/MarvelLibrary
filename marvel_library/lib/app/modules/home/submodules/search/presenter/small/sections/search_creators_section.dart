import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/submodules/search/presenter/search_store.dart';

class SearchCreatorsSection extends StatefulWidget {
  final String title;
  const SearchCreatorsSection({Key? key, this.title = 'SearchCreatorsSection'})
      : super(key: key);
  @override
  SearchCreatorsSectionState createState() => SearchCreatorsSectionState();
}

class SearchCreatorsSectionState extends State<SearchCreatorsSection> {
  final SearchStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.green, height: 50);
  }
}
