import 'package:google_sign_in/google_sign_in.dart';

class ConfigConstants {
  static String googleClientId =
      '588733118015-bpnkmqaitbvavrnig9294aqulmrb8ufe.apps.googleusercontent.com';

  static GoogleSignIn googleSignIn = GoogleSignIn(
    clientId: ConfigConstants.googleClientId,
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
}
