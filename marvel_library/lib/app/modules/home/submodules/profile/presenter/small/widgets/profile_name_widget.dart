import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_library/app/modules/home/submodules/profile/presenter/profile_store.dart';
import 'package:marvel_library/app/themes/marvel_theme.dart';

class ProfileNameWidget extends StatefulWidget {
  final String title;
  const ProfileNameWidget({Key? key, this.title = 'ProfileNameWidget'})
      : super(key: key);
  @override
  ProfileNameWidgetState createState() => ProfileNameWidgetState();
}

class ProfileNameWidgetState extends State<ProfileNameWidget> {
  final ProfileStore store = Modular.get();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Olá,",
          textAlign: TextAlign.justify,
          style: GoogleFonts.cousine(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: MarvelTheme.neutralHighLight),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Text(
            store.googleUser?.displayName ?? "-",
            textAlign: TextAlign.justify,
            style: GoogleFonts.cousine(
                fontSize: 16,
                fontWeight: FontWeight.w200,
                color: MarvelTheme.neutralHighLight),
          ),
        )
      ],
    );
  }
}
