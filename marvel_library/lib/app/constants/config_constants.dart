import 'package:google_sign_in/google_sign_in.dart';

class ConfigConstants {
  static String googleClientId =
      '588733118015-0l0hmofks7qo77pkn3us6l428dio1v5u.apps.googleusercontent.com';

  static GoogleSignIn googleSignIn = GoogleSignIn(
    clientId: ConfigConstants.googleClientId,
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  static String APIHash = "2e3bd69ca55f342e9610998d98625f75";
  static String ts = "1";
  static String APIKey = "47ecb8d7dc38641d2c9b4af0324f89d9";

  static String hostnameMarvel = "http://gateway.marvel.com/v1/public";
}
