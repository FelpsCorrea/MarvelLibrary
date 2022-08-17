import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_library/app/modules/home/submodules/start/presenter/small/buttons/view_more_button.dart';
import 'package:marvel_library/app/modules/home/submodules/start/presenter/small/cards/creator_start_card.dart';
import 'package:marvel_library/app/modules/home/submodules/start/presenter/start_store.dart';
import 'package:marvel_library/app/themes/marvel_theme.dart';

class CreatorsStartSection extends StatefulWidget {
  const CreatorsStartSection({Key? key}) : super(key: key);

  @override
  CreatorsStartSectionState createState() => CreatorsStartSectionState();
}

class CreatorsStartSectionState extends State<CreatorsStartSection> {
  final StartStore store = Modular.get();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(left: 16, bottom: 8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Criadores",
                textAlign: TextAlign.justify,
                style: GoogleFonts.cousine(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: MarvelTheme.neutralHighLight),
              ),
              const ViewMoreButton(goTo: "Criadores")
            ],
          ),
        ),
        Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Observer(builder: (_) {
            return ListView.builder(
              controller: ScrollController(),
              itemCount: store.creators.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CreatorStartCard(creator: store.creators[index]);
              },
            );
          }),
        ),
      ],
    );
  }
}
