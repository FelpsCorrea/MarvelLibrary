import 'package:google_sign_in/google_sign_in.dart';
import 'package:marvel_library/app/constants/config_constants.dart';
import 'package:marvel_library/app/modules/login/domain/errors/errors.dart';
import 'package:marvel_library/app/modules/login/infra/datasources/login_google_datasource.dart';

class HttpLoginGoogle implements LoginGoogleDatasource {
  @override
  Future<GoogleSignInAccount> loginGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      clientId: ConfigConstants.googleClientId,
      scopes: <String>[
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

    try {
      GoogleSignInAccount? _currentUser = await _googleSignIn.signInSilently();

      if (_currentUser == null) {
        _googleSignIn.onCurrentUserChanged
            .listen((GoogleSignInAccount? account) {
          if (account != null) {
            _currentUser = account;
          }
        });
      }

      if (_currentUser != null) {
        return _currentUser!;
      } else {
        throw LoginGoogleException("Erro ao efetuar o login");
      }
    } catch (e) {
      throw LoginGoogleException(e.toString());
    }
  }
}
