import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/submodules/start/presenter/small/widgets/carousel_widget.dart';
import 'package:marvel_library/app/modules/home/submodules/start/presenter/start_store.dart';
import 'package:marvel_library/app/themes/marvel_theme.dart';
import 'package:marvel_library/app/themes/opera_theme.dart';

class SmallStartPage extends StatefulWidget {
  final String title;
  const SmallStartPage({Key? key, this.title = 'SmallStartPage'})
      : super(key: key);
  @override
  SmallStartPageState createState() => SmallStartPageState();
}

class SmallStartPageState extends State<SmallStartPage> {
  final StartStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MarvelTheme.hyperDarkGray,
      child: CarouselWidget(),
    );
  }
}
