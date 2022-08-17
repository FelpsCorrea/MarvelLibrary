import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/submodules/profile/presenter/profile_store.dart';
import 'package:marvel_library/app/modules/home/submodules/profile/presenter/small/buttons/logout_button.dart';
import 'package:marvel_library/app/modules/home/submodules/profile/presenter/small/widgets/profile_thumb_widget.dart';

class SmallProfilePage extends StatefulWidget {
  final String title;
  const SmallProfilePage({Key? key, this.title = 'SmallProfilePage'})
      : super(key: key);
  @override
  SmallProfilePageState createState() => SmallProfilePageState();
}

class SmallProfilePageState extends State<SmallProfilePage> {
  final ProfileStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ProfileThumbWidget(), LogoutButton()],
      ),
    );
  }
}
