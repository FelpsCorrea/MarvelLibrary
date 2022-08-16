import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/submodules/favorites/presenter/favorites_store.dart';

class SmallFavoritesPage extends StatefulWidget {
  final String title;
  const SmallFavoritesPage({Key? key, this.title = 'SmallFavoritesPage'}) : super(key: key);
  @override
  SmallFavoritesPageState createState() => SmallFavoritesPageState();
}
class SmallFavoritesPageState extends State<SmallFavoritesPage> {
  final FavoritesStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
    );
  }
}