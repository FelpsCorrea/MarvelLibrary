import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/submodules/profile/presenter/profile_store.dart';

class SmallProfilePage extends StatefulWidget {
  final String title;
  const SmallProfilePage({Key? key, this.title = 'SmallProfilePage'}) : super(key: key);
  @override
  SmallProfilePageState createState() => SmallProfilePageState();
}
class SmallProfilePageState extends State<SmallProfilePage> {
  final ProfileStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}