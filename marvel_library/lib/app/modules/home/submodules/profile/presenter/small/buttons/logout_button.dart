import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_library/app/modules/home/submodules/profile/presenter/profile_store.dart';
import 'package:marvel_library/app/themes/marvel_theme.dart';

class LogoutButton extends StatefulWidget {
  final String title;
  const LogoutButton({Key? key, this.title = 'LogoutButton'}) : super(key: key);
  @override
  LogoutButtonState createState() => LogoutButtonState();
}

class LogoutButtonState extends State<LogoutButton> {
  final ProfileStore store = Modular.get();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        store.logoutDialog();
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: MarvelTheme.burgundy[100]!, width: 2)),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Logout',
              style: TextStyle(color: MarvelTheme.burgundy[100]),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              FeatherIcons.logOut,
              size: 24.0,
              color: MarvelTheme.burgundy[100],
            ),
          ],
        ),
      ),
    );
  }
}
