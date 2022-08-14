import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/submodules/hq_detail/hqDetail_store.dart';
import 'package:flutter/material.dart';

class HqDetailPage extends StatefulWidget {
  final String title;
  const HqDetailPage({Key? key, this.title = 'HqDetailPage'}) : super(key: key);
  @override
  HqDetailPageState createState() => HqDetailPageState();
}
class HqDetailPageState extends State<HqDetailPage> {
  final HqDetailStore store = Modular.get();

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