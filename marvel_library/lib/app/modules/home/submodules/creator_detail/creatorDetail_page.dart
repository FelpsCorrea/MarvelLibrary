import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/submodules/creator_detail/creatorDetail_store.dart';
import 'package:flutter/material.dart';

class CreatorDetailPage extends StatefulWidget {
  final String title;
  const CreatorDetailPage({Key? key, this.title = 'CreatorDetailPage'}) : super(key: key);
  @override
  CreatorDetailPageState createState() => CreatorDetailPageState();
}
class CreatorDetailPageState extends State<CreatorDetailPage> {
  final CreatorDetailStore store = Modular.get();

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