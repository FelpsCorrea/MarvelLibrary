import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/submodules/search/presenter/search_store.dart';
import 'package:marvel_library/app/modules/home/submodules/search/presenter/small/buttons/search_more_button.dart';
import 'package:marvel_library/app/modules/home/submodules/search/presenter/small/cards/searched_character_widget.dart';

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
    return Observer(builder: (_) {
      return ListView.builder(
        controller: ScrollController(),
        itemCount: store.charactersList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    bottom: store.isTheLastCard(index) ? 100 : 16),
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                    child: SearchedCharacterCard(
                        character: store.charactersList[index])),
              ),
              store.showSearchMoreButton(index)
                  ? const SearchMoreButton()
                  : Container()
            ],
          );
        },
      );
    });
  }
}
