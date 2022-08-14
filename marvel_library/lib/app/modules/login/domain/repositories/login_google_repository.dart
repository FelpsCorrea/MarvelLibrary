import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:marvel_library/app/modules/login/domain/errors/errors.dart';

abstract class LoginGoogleRepository {
  Future<Either<LoginGoogleException, GoogleSignInAccount>> loginGoogle();
}
