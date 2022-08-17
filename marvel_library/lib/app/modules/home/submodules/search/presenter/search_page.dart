import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:marvel_library/app/modules/home/submodules/search/presenter/search_store.dart';
import 'package:marvel_library/app/modules/home/submodules/search/presenter/small/small_search_page.dart';
import 'package:marvel_library/app/utils/tutorial_widget.dart';

class SearchPage extends StatefulWidget {
  final String option;

  const SearchPage({super.key, required this.option});
  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  final SearchStore store = Modular.get();

  @override
  void initState() {
    super.initState();
    store.setSelectedFilterOption(widget.option);
    store.changeLoading(withTimer: true);
    store.changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 1080) {
        return const SmallSearchPage();
      } else {
        return const TutorialWidget();
      }
    });
  }
}
