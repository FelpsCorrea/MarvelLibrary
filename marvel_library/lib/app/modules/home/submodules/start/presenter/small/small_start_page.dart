import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/submodules/start/presenter/small/sections/characters_start_section.dart';
import 'package:marvel_library/app/modules/home/submodules/start/presenter/small/sections/comics_start_section.dart';
import 'package:marvel_library/app/modules/home/submodules/start/presenter/small/sections/creators_start_section.dart';
import 'package:marvel_library/app/modules/home/submodules/start/presenter/small/widgets/carousel_widget.dart';
import 'package:marvel_library/app/modules/home/submodules/start/presenter/start_store.dart';

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
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CarouselWidget(),
            SizedBox(height: 32),
            CharactersStartSection(),
            SizedBox(height: 24),
            ComicsStartSection(),
            SizedBox(height: 24),
            CreatorsStartSection(),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
