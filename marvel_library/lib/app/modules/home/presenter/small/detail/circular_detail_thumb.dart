import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/presenter/home_store.dart';

class CircularDetailThumbWidget extends StatefulWidget {
  final String thumbPath;

  const CircularDetailThumbWidget({super.key, required this.thumbPath});

  @override
  CircularDetailThumbWidgetState createState() =>
      CircularDetailThumbWidgetState();
}

class CircularDetailThumbWidgetState extends State<CircularDetailThumbWidget> {
  final HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      margin: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: NetworkImage(widget.thumbPath), fit: BoxFit.fill),
      ),
    );
  }
}
