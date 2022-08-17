import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/domain/entities/character.dart';
import 'package:marvel_library/app/modules/home/submodules/start/presenter/start_store.dart';

class CharacterStartCard extends StatefulWidget {
  final Character character;
  const CharacterStartCard({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  CharacterStartCardState createState() => CharacterStartCardState();
}

class CharacterStartCardState extends State<CharacterStartCard> {
  final StartStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        store.getCharacterById(widget.character.id);
      },
      child: Container(
        width: 100,
        height: 100,
        margin: const EdgeInsets.only(left: 8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(
                  "${widget.character.thumbnail!.path}.${widget.character.thumbnail!.extension}"),
              fit: BoxFit.fill),
        ),
      ),
    );
  }
}
