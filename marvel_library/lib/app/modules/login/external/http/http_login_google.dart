import 'package:google_sign_in/google_sign_in.dart';
import 'package:marvel_library/app/constants/config_constants.dart';
import 'package:marvel_library/app/modules/login/domain/errors/errors.dart';
import 'package:marvel_library/app/modules/login/infra/datasources/login_google_datasource.dart';

class HttpLoginGoogle implements LoginGoogleDatasource {
  @override
  Future<GoogleSignInAccount> loginGoogle() async {
    GoogleSignIn _googleSignIn = ConfigConstants.googleSignIn;

    try {
      GoogleSignInAccount? _currentUser = await _googleSignIn.signInSilently();

      if (_currentUser == null) {
        try {
          _currentUser = await _googleSignIn.signIn();
        } catch (error) {
          print(error);
          throw LoginGoogleException(error.toString());
        }
      }
      if (_currentUser != null) {
        return _currentUser;
      } else {
        throw LoginGoogleException("Erro ao efetuar o login");
      }
    } catch (e) {
      throw LoginGoogleException(e.toString());
    }
  }
}
