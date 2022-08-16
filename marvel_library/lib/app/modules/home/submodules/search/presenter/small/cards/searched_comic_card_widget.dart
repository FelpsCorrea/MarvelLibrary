import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/domain/entities/comic.dart';
import 'package:marvel_library/app/modules/home/submodules/search/presenter/search_store.dart';

class SearchedComicCard extends StatefulWidget {
  final Comic comic;

  const SearchedComicCard({super.key, required this.comic});
  @override
  SearchedComicCardState createState() => SearchedComicCardState();
}

class SearchedComicCardState extends State<SearchedComicCard> {
  final SearchStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.yellow, height: 50);
  }
}
