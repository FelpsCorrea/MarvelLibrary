import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/presenter/home_store.dart';
import 'package:marvel_library/app/modules/home/submodules/profile/presenter/profile_store.dart';
import 'package:flutter/material.dart';
import 'package:marvel_library/app/modules/home/submodules/profile/presenter/small/small_profile_page.dart';
import 'package:marvel_library/app/utils/tutorial_widget.dart';

class ProfilePage extends StatefulWidget {
  final String title;
  const ProfilePage({Key? key, this.title = 'ProfilePage'}) : super(key: key);
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  final ProfileStore store = Modular.get();

  @override
  void initState() {
    store.setGoogleUser(Modular.get<HomeStore>().googleUser!);
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 1080) {
        return SmallProfilePage();
      } else {
        return TutorialWidget();
      }
    });
  }
}
