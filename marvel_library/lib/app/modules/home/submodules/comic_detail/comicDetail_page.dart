import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/submodules/comic_detail/comicDetail_store.dart';
import 'package:flutter/material.dart';

class ComicDetailPage extends StatefulWidget {
  final String title;
  const ComicDetailPage({Key? key, this.title = 'ComicDetailPage'}) : super(key: key);
  @override
  ComicDetailPageState createState() => ComicDetailPageState();
}
class ComicDetailPageState extends State<ComicDetailPage> {
  final ComicDetailStore store = Modular.get();

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