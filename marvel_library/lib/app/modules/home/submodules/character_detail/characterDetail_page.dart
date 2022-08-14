import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/submodules/character_detail/characterDetail_store.dart';
import 'package:flutter/material.dart';

class CharacterDetailPage extends StatefulWidget {
  final String title;
  const CharacterDetailPage({Key? key, this.title = 'CharacterDetailPage'}) : super(key: key);
  @override
  CharacterDetailPageState createState() => CharacterDetailPageState();
}
class CharacterDetailPageState extends State<CharacterDetailPage> {
  final CharacterDetailStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}