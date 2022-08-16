import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_library/app/modules/home/submodules/search/presenter/search_store.dart';
import 'package:marvel_library/app/modules/home/submodules/search/presenter/small/widgets/search_text_field_widget.dart';
import 'package:marvel_library/app/themes/marvel_theme.dart';

class SmallSearchPage extends StatefulWidget {
  final String title;
  const SmallSearchPage({Key? key, this.title = 'SmallSearchPage'}) : super(key: key);
  @override
  SmallSearchPageState createState() => SmallSearchPageState();
}
class SmallSearchPageState extends State<SmallSearchPage> {
  final SearchStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      color: Colors.blue,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SearchTextFieldWidget()
          ],
        ),
      ),
    );
  }
}