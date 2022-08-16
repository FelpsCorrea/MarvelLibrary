import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/submodules/search/presenter/search_store.dart';
import 'package:marvel_library/app/modules/home/submodules/search/presenter/small/widgets/search_filter_options_widget.dart';
import 'package:marvel_library/app/modules/home/submodules/search/presenter/small/widgets/search_text_field_widget.dart';
import 'package:marvel_library/app/themes/marvel_theme.dart';

class SearchSection extends StatefulWidget {
  final String title;
  const SearchSection({Key? key, this.title = 'SearchSection'})
      : super(key: key);
  @override
  SearchSectionState createState() => SearchSectionState();
}

class SearchSectionState extends State<SearchSection> {
  final SearchStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MarvelTheme.superDarkGray,
      margin: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SearchTextFieldWidget(),
          SizedBox(height: 16),
          SearchFilterOptionsWidget()
        ],
      ),
    );
  }
}
