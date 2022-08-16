import 'package:flutter/material.dart';
import 'package:marvel_library/app/modules/home/presenter/small/small_home_page.dart';
import 'package:marvel_library/app/utils/tutorial_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 1080) {
        return SmallHomePage();
      } else {
        return TutorialWidget();
      }
    });
  }
}
