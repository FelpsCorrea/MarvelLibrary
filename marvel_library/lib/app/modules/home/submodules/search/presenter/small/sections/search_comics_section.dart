import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/submodules/search/presenter/search_store.dart';
import 'package:marvel_library/app/modules/home/submodules/search/presenter/small/cards/searched_comic_card_widget.dart';
import 'package:marvel_library/app/modules/home/submodules/search/presenter/small/buttons/search_more_button.dart';

class SearchComicsSection extends StatefulWidget {
  final String title;
  const SearchComicsSection({Key? key, this.title = 'SearchComicsSection'})
      : super(key: key);
  @override
  SearchComicsSectionState createState() => SearchComicsSectionState();
}

class SearchComicsSectionState extends State<SearchComicsSection> {
  final SearchStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ListView.builder(
        controller: ScrollController(),
        itemCount: store.comicsList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    bottom: store.isTheLastComic(index) ? 100 : 16),
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                    child: SearchedComicCard(comic: store.comicsList[index])),
              ),
              store.showSearchMoreComicsButton(index)
                  ? const SearchMoreButton()
                  : Container()
            ],
          );
        },
      );
    });
  }
}
