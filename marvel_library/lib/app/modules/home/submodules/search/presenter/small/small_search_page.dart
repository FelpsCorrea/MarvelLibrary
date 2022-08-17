import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/submodules/search/presenter/search_store.dart';
import 'package:marvel_library/app/modules/home/submodules/search/presenter/small/sections/search_section.dart';

class SmallSearchPage extends StatefulWidget {
  final String title;
  const SmallSearchPage({Key? key, this.title = 'SmallSearchPage'})
      : super(key: key);
  @override
  SmallSearchPageState createState() => SmallSearchPageState();
}

class SmallSearchPageState extends State<SmallSearchPage> {
  final SearchStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchSection(),
        Expanded(child: Observer(builder: (_) {
          return store.currentSection;
        }))
      ],
    );
  }
}
