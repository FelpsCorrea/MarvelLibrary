import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvel_library/app/modules/login/presenter/login_store.dart';
import 'package:marvel_library/app/themes/marvel_theme.dart';

class LoginGoogleButton extends StatefulWidget {
  final String title;
  const LoginGoogleButton({Key? key, this.title = 'LoginGoogleButton'})
      : super(key: key);
  @override
  LoginGoogleButtonState createState() => LoginGoogleButtonState();
}

class LoginGoogleButtonState extends State<LoginGoogleButton> {
  final LoginStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: store.loginGoogle,
      child: Container(
        padding: EdgeInsets.all(8),
        width: MediaQuery.of(context).size.height * 0.4,
        decoration: BoxDecoration(
            color: MarvelTheme.white,
            border: Border.all(color: MarvelTheme.neutralLowLightest),
            borderRadius: BorderRadius.circular(8)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(
            "Login Google",
            style: GoogleFonts.inter(
                color: MarvelTheme.neutralLowDark,
                fontWeight: FontWeight.w600,
                fontSize: 16),
          ),
          Image.asset('assets/icons/google_icon.png', width: 20, height: 20)
        ]),
      ),
    );
  }
}
