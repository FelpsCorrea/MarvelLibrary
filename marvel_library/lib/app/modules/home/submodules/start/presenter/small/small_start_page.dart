import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/submodules/start/presenter/start_store.dart';

class SmallStartPage extends StatefulWidget {
  final String title;
  const SmallStartPage({Key? key, this.title = 'SmallStartPage'}) : super(key: key);
  @override
  SmallStartPageState createState() => SmallStartPageState();
}
class SmallStartPageState extends State<SmallStartPage> {
  final StartStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red
    );
  }
}