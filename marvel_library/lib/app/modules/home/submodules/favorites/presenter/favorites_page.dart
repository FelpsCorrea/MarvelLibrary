import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:marvel_library/app/modules/home/submodules/favorites/presenter/favorites_store.dart';
import 'package:marvel_library/app/modules/home/submodules/favorites/presenter/small/small_favorites_page.dart';
import 'package:marvel_library/app/utils/tutorial_widget.dart';

class FavoritesPage extends StatefulWidget {
  final String title;
  const FavoritesPage({Key? key, this.title = 'FavoritesPage'}) : super(key: key);
  @override
  FavoritesPageState createState() => FavoritesPageState();
}
class FavoritesPageState extends State<FavoritesPage> {
  final FavoritesStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 1080) {
        return SmallFavoritesPage();
      } else {
        return TutorialWidget();
      }
    });
  }
}