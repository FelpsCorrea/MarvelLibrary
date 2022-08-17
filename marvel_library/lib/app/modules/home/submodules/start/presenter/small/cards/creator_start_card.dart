import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/domain/entities/creator.dart';
import 'package:marvel_library/app/modules/home/submodules/start/presenter/start_store.dart';

class CreatorStartCard extends StatefulWidget {
  final Creator creator;
  const CreatorStartCard({
    Key? key,
    required this.creator,
  }) : super(key: key);

  @override
  CreatorStartCardState createState() => CreatorStartCardState();
}

class CreatorStartCardState extends State<CreatorStartCard> {
  final StartStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        store.getCreatorById(widget.creator.id);
      },
      child: Container(
        width: 100,
        height: 100,
        margin: const EdgeInsets.only(left: 8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(
                  "${widget.creator.thumbnail!.path}.${widget.creator.thumbnail!.extension}"),
              fit: BoxFit.fill),
        ),
      ),
    );
  }
}
