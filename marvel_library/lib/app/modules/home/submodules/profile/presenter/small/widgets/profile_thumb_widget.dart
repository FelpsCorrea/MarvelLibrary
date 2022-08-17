import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/submodules/profile/presenter/profile_store.dart';

class ProfileThumbWidget extends StatefulWidget {
  final String title;
  const ProfileThumbWidget({Key? key, this.title = 'ProfileThumbWidget'})
      : super(key: key);
  @override
  ProfileThumbWidgetState createState() => ProfileThumbWidgetState();
}

class ProfileThumbWidgetState extends State<ProfileThumbWidget> {
  final ProfileStore store = Modular.get();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      margin: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: NetworkImage(store.googleUser!.photoUrl ??
                "http://polosolucoes.com.br/wp-content/uploads/2020/06/avatar.png"),
            fit: BoxFit.fill),
      ),
    );
  }
}
